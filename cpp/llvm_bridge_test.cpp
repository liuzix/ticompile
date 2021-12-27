#include "llvm_bridge.h"

#include <gtest/gtest.h>

TEST(TestLLVMBridge, TestCompileLLVMIR)
{
    std::string ir = R"(
        define i64 @jit_main(i64 %x) {
            %tmp = add i64 1, %x
            ret i64 %tmp
        }
    )";
    const char* buf = ir.data();
    size_t len = ir.size();

    void* result = compileLLVMIR(buf, len);
    EXPECT_NE(result, nullptr);

    auto fp = (uint64_t(*)(uint64_t))(result);

    for (int i = 0; i < 1000; i++) {
        uint64_t ret = fp(i);
        EXPECT_EQ(ret, i + 1);
    }
}