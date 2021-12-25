#include "helpers.h"

#include <gtest/gtest.h>

TEST(HelperTest, TestMakeMemoryBuffer)
{
    const char testData[] = { 0x1, 0x2, 0x3, 0x4 };
    size_t testDataLen = 4;
    auto memoryBuf = makeMemoryBuffer(testData, testDataLen);

    EXPECT_EQ(memoryBuf->getBufferSize(), testDataLen);
    EXPECT_EQ(memoryBuf->getBufferStart()[0], 0x1);
    EXPECT_EQ(memoryBuf->getBufferStart()[1], 0x2);
    EXPECT_EQ(memoryBuf->getBufferStart()[2], 0x3);
    EXPECT_EQ(memoryBuf->getBufferStart()[3], 0x4);
}

TEST(HelperTest, TestMakeModuleFromMemoryBuffer)
{
    std::string ir = R"(
        define i32 @mul_add(i32 %x, i32 %y, i32 %z) {
            entry:
            %tmp = mul i32 %x, %y
            %tmp2 = add i32 %tmp, %z
            ret i32 %tmp2
        }
    )";
    auto buf = makeMemoryBuffer(ir.data(), ir.size());

    llvm::LLVMContext context;
    auto module = makeModuleFromMemoryBuffer(context, buf->getMemBufferRef());
    EXPECT_TRUE(!!module);
}

TEST(HelperTest, TestGenerateFreshJITSymbolName)
{
    std::string oldName;
    for (int i = 0; i < 100; i++) {
        std::string newName = generateFreshJITSymbolName();
        EXPECT_NE(newName, oldName);
        oldName = std::move(newName);
    }
}