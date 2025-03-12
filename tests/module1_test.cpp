#include "module1/module1.h"
#include <gtest/gtest.h>

TEST(Module1Test, GreetTest)
{
    testing::internal::CaptureStdout();
    module1::greet("Test");
    std::string output = testing::internal::GetCapturedStdout();
    EXPECT_EQ(output, "Hello from Module 1, Test!\n");
}
