
### Extra libs go here vvv (e.g. math.h)
LIBS = -lm

###
CC      = gcc
CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Werror
CFLAGS += -Wmissing-declarations
CFLAGS += -DUNITY_SUPPORT_64 -DUNITY_OUTPUT_COLOR
TEST_FRAMEWORK = test-framework/unity.c

.PHONY: test
test: tests.out ./*.c ./*.h
	@./tests.out

.PHONY: clean
clean:
	rm -rf *.o *.out *.out.dSYM

tests.out: ./*.c ./*.h
	@echo Compiling $@
	$(CC) $(CFLAGS) $(TEST_FRAMEWORK) ./*.c -o tests.out $(LIBS)
	@echo
