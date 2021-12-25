#pragma once

#include <cstddef>
#include <llvm/IR/Module.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/TargetRegistry.h>
#include <memory>

using namespace llvm;

struct GlobalInitializer;

std::unique_ptr<MemoryBuffer> makeMemoryBuffer(const char* bytes, size_t len);
const Target* getLLVMTarget();
std::unique_ptr<Module> makeModuleFromMemoryBuffer(llvm::LLVMContext& context, MemoryBufferRef buf);
std::string generateFreshJITSymbolName();