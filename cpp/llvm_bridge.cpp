#include "llvm_bridge.h"

#include "helpers.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"

extern "C" void* compileLLVMIR(const char* ir, size_t len)
{
    auto memBuf = makeMemoryBuffer(ir, len);

    llvm::SMDiagnostic err;
    llvm::LLVMContext context;

    auto module = llvm::parseIR(memBuf->getMemBufferRef(), err, context);
}