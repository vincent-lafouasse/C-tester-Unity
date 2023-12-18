#include "my_lib.h"
#include "unity_fixture.h"

#include <stdio.h>

TEST_GROUP(Module);
TEST_SETUP(Module) {}
TEST_TEAR_DOWN(Module) {}

TEST(Module, Get42)
{
    int expected = 42;
    int actual = get_42();

    char error[100];
    sprintf(error, "Error found, expected %d was %d", expected, actual);
    TEST_ASSERT_MESSAGE(expected == actual, error);
}

TEST_GROUP_RUNNER(Module)
{
    printf("\e[34m----- Module -----\e[0m\n");
    RUN_TEST_CASE(Module, Get42);
}
