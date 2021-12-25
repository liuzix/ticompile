#include "helpers.h"

#include <cstddef>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/Host.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/SourceMgr.h>
#include <memory>
#include <spdlog/spdlog.h>

using namespace llvm;

std::unique_ptr<MemoryBuffer> makeMemoryBuffer(const char* bytes, size_t len)
{
    StringRef stringRef(bytes, len);
    return MemoryBuffer::getMemBuffer(stringRef, "",
        false /* no null-terminator */);
}

std::unique_ptr<Module> makeModuleFromMemoryBuffer(llvm::LLVMContext& context, MemoryBufferRef buf)
{
    llvm::SMDiagnostic err;
    auto module = llvm::parseIR(buf, err, context);
    if (!module) {
        spdlog::error("failed to parse IR: {}",
            err.getMessage());
        return nullptr;
    }
    return module;
}

std::string generateFreshJITSymbolName()
{
    static std::atomic_int64_t counter(0);
    int64_t freshCount = counter.fetch_add(1, std::memory_order_seq_cst);
    return std::to_string(freshCount);
}