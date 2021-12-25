#include "llvm_bridge.h"

#include "TiJIT.h"
#include "helpers.h"
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Target/TargetMachine.h>
#include <memory>
#include <spdlog/spdlog.h>

using namespace llvm;
using namespace llvm::orc;

#define JIT_FUNC_NAME "jit_main"

struct GlobalStates {
    std::unique_ptr<TiJIT> jit;
    ThreadSafeContext ctx;

    GlobalStates()
    {
        spdlog::info("llvm_bridge: initializing library");
        // Note that InitializeNativeTarget returns **false** on success.
        if (InitializeNativeTarget()) {
            spdlog::error("llvm_bridge: fail to initialize target");
        }

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
    jitMain->setName(generateFreshJITSymbolName());

    global.jit->addModule(std::move(module));
    auto sym = cantFail(global.jit->lookup("test"));
    // sym.getAddress()
}