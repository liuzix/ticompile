#pragma once

#include <llvm/ADT/StringRef.h>
#include <llvm/ExecutionEngine/JITSymbol.h>
#include <llvm/ExecutionEngine/Orc/CompileUtils.h>
#include <llvm/ExecutionEngine/Orc/Core.h>
#include <llvm/ExecutionEngine/Orc/ExecutionUtils.h>
#include <llvm/ExecutionEngine/Orc/IRCompileLayer.h>
#include <llvm/ExecutionEngine/Orc/JITTargetMachineBuilder.h>
#include <llvm/ExecutionEngine/Orc/RTDyldObjectLinkingLayer.h>
#include <llvm/ExecutionEngine/SectionMemoryManager.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/LLVMContext.h>
#include <memory>
#include <spdlog/spdlog.h>

using namespace llvm;
using namespace llvm::orc;

class TiJIT {
    ExecutionSession es;
    RTDyldObjectLinkingLayer objectLayer;
    IRCompileLayer compileLayer;
    DataLayout dl;
    MangleAndInterner mangle;
    JITDylib& mainJD;
    ThreadSafeContext ctx;

public:
    TiJIT(JITTargetMachineBuilder JTMB, DataLayout DL)
        : objectLayer(es,
            []() { return std::make_unique<SectionMemoryManager>(); })
        , es(std::move(SelfExecutorProcessControl::Create().get()))
        , compileLayer(es, objectLayer, std::make_unique<ConcurrentIRCompiler>(std::move(JTMB)))
        , dl(DL)
        , mangle(es,
              this->dl)
        , mainJD(es.createBareJITDylib("<main>"))
        , ctx(std::make_unique<LLVMContext>())
    {
        mainJD.addGenerator(
            cantFail(DynamicLibrarySearchGenerator::GetForCurrentProcess(
                DL.getGlobalPrefix())));
    }

    static Expected<std::unique_ptr<TiJIT>> Create()
    {
        auto builder = JITTargetMachineBuilder(Triple("x86_64-unknown-linux"));
        auto triple = builder.getTargetTriple();
        spdlog::info("triple {}", triple.str());
        auto layout = DataLayout("e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i32:32:32-i8:8:8-i1:8:8-f80:128-n8:16:32:64-S128");
        return std::make_unique<TiJIT>(std::move(builder), std::move(layout));
    }

    const DataLayout& getDataLayout() const { return dl; }

    JITDylib& getMainJITDylib() { return mainJD; }

    void addModule(std::unique_ptr<Module> M)
    {
        cantFail(compileLayer.add(this->mainJD,
            ThreadSafeModule(std::move(M), ctx)));
    }

    bool removeModule(StringRef name)
    {
        auto err = mainJD.remove({ mangle(name.str()) });
        if (err) {
            spdlog::error("llvm_bridge: failed to remove module: {}",
                toString(std::move(err)));
            return false;
        }
        return true;
    }

    Expected<JITEvaluatedSymbol> lookup(StringRef Name)
    {
        return es.lookup({ &mainJD }, mangle(Name.str()));
    }
};