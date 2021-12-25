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