#include "my_lib.h"
#include "test-framework/unity.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void	setUp(void)
{
}

void	tearDown(void)
{
}

static void	test_42(void)
{
	TEST_ASSERT_EQUAL_INT(42, get_42());
}

int	main(void)
{
	UnityBegin("test.c");
	RUN_TEST(test_42);
	return (UnityEnd());
}
