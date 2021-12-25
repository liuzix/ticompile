#include "TiJIT.h"

#include "helpers.h"
#include <gtest/gtest.h>
#include <llvm/Support/TargetSelect.h>

TEST(TestTiJIT, TestTiJITBasics)
{
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();
    auto jit = cantFail(TiJIT::Create());
    EXPECT_TRUE(!!jit);

    std::string ir = R"(
        define i64 @jit_main(i64 %x) {
            %tmp = add i64 1, %x
            ret i64 %tmp
        }
    )";
    auto buf = makeMemoryBuffer(ir.data(), ir.size());

    llvm::LLVMContext context;
    auto module = makeModuleFromMemoryBuffer(context, buf->getMemBufferRef());
    EXPECT_TRUE(!!module);

    module->setDataLayout(jit->getDataLayout());
    auto jitMain = module->getFunction("jit_main");

    const std::string freshName = generateFreshJITSymbolName();
    jitMain->setName(freshName);
    jit->addModule(std::move(module));

    auto sym = cantFail(jit->lookup(freshName));
    auto* fp = (int64_t(*)(int64_t))(intptr_t)sym.getAddress();

    EXPECT_EQ(fp(2), 3);

    EXPECT_TRUE(jit->removeModule(freshName));

    auto result = jit->lookup(freshName);
    // Asserts failure
    EXPECT_TRUE(!result);
}