#include "llvm_bridge.h"

#include "TiJIT.h"
#include "helpers.h"
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Target/TargetMachine.h>
#include <memory>
#include <spdlog/spdlog.h>

using namespace llvm;

#define JIT_FUNC_NAME "jit_main"

struct GlobalStates {
    std::unique_ptr<TiJIT> jit;
    ThreadSafeContext ctx;

    GlobalStates()
        : ctx(std::make_unique<LLVMContext>())
    {
        spdlog::info("llvm_bridge: initializing library");
        llvm::InitializeNativeTarget();
        llvm::InitializeNativeTargetAsmPrinter();
        llvm::InitializeNativeTargetAsmParser();

        jit = cantFail(TiJIT::Create());
    }
};

[[maybe_unused]] static GlobalStates global = GlobalStates();

extern "C" void* compileLLVMIR(const char* ir, size_t len)
{
    auto memBuf = makeMemoryBuffer(ir, len);
    auto module = makeModuleFromMemoryBuffer(*global.ctx.getContext(), memBuf->getMemBufferRef());
    module->setDataLayout(global.jit->getDataLayout());
    auto jitMain = module->getFunction(JIT_FUNC_NAME);

    const std::string jitSymbolName = generateFreshJITSymbolName();
    jitMain->setName(jitSymbolName);

    global.jit->addModule(std::move(module));
    auto sym = global.jit->lookup(jitSymbolName);
    if (!sym) {
        spdlog::error("llvm_bridge: JIT look up symbol {} failed: {}",
            jitSymbolName, toString(sym.takeError()));
        return nullptr;
    }

    spdlog::debug("llvm_bridge: JIT compilation finished. Symbol name: {}, address: {}",
        jitSymbolName, (uint64_t)sym->getAddress());
    return (void*)sym->getAddress();
}