#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "test-framework/unity.h"
#include "my_lib.h"

// more info at:
// github.com/ThrowTheSwitch/Unity/blob/master/docs/UnityGettingStartedGuide.md

char* read_from_file(void);

void setUp(void)
{
}

void tearDown(void)
{
}

static void test_42(void)
{
    TEST_ASSERT_EQUAL_INT (42, get_42());
}

int main(void)
{
   UnityBegin("test.c");

   RUN_TEST(test_42);

   return UnityEnd();
}

char* read_from_file(void)
{
}
