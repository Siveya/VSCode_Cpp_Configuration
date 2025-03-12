#include "module2/module2.h"
#include <gtest/gtest.h>

TEST(Module2Test, GreetTest)
{
    testing::internal::CaptureStdout();
    module2::greet("Test");
    std::string output = testing::internal::GetCapturedStdout();
    EXPECT_EQ(output, "Hello from Module 2, Test!\n");
}
