#include <gtest/gtest.h>
#include <string>
#include "add.hpp"

TEST(AddTest, AddsDoubles) {
    EXPECT_EQ(add(1.5, 2.5), 4.0);
}

TEST(AddTest, AddsLongs) {
    long long a = 500;
    long long b = 524;
    EXPECT_EQ(add(a, b), 1024);
    EXPECT_EQ(add(a, b), a + b);
}

TEST(AddTest, AddsStrings) {
    const std::string a = "He";
    const std::string b = "llo";
    EXPECT_EQ(add(a, b), "Hello");
}
