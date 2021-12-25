#include "helpers.h"

#include <llvm/ADT/StringRef.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/TargetSelect.h>
#include <spdlog/spdlog.h>

#include <cstddef>
#include <memory>

using namespace llvm;

struct GlobalInitializer {
    GlobalInitializer()
    {
        spdlog::info("llvm_bridge: initializing library");
        // Note that InitializeNativeTarget returns **false** on success.
        if (InitializeNativeTarget()) {
            spdlog::error("llvm_bridge: fail to initialize target");
        }
    }
};

[[maybe_unused]] static GlobalInitializer init = GlobalInitializer();

std::unique_ptr<MemoryBuffer> makeMemoryBuffer(const char* bytes, size_t len)
{
    StringRef stringRef(bytes, len);
    return MemoryBuffer::getMemBuffer(stringRef, "",
        false /* no null-terminator */);
}