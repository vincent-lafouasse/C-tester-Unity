LIB = unity.a

CC = clang

SRC_DIR    = ./src
INC_DIRS   = ./include ./src
BUILD_DIR  = ./build

HEADERS  = include/unity.h include/unity_fixture.h include/unity_memory.h
HEADERS += src/unity_fixture_internals.h src/unity_internals.h

SRCS = src/unity.c src/unity_fixture.c src/unity_memory.c
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CFLAGS  = -Wall -Wextra
#CFLAGS += -Werror
CFLAGS += $(INC_FLAGS)

.PHONY: all
all: build

.PHONY: build
build: $(LIB)

$(LIB): $(OBJS) $(HEADERS)
	echo Building unity library
	ar rcs $(LIB) $(OBJS)
	printf "$(GREEN)===============BUILD COMPLETED===============$(NC)\n"

$(BUILD_DIR)/%.c.o: %.c $(HEADERS)
	echo Compiling $<
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	echo Cleaning up object files
	rm -rf $(BUILD_DIR)

.PHONY: fclean
fclean: clean
	echo Cleaning up lib
	rm -rf $(LIB)
	make -C test clean

.PHONY: re
re: fclean update

# LSP stuff, don't worry about it
.PHONY: update
update:
	make clean
	mkdir -p $(BUILD_DIR)
	bear --output $(BUILD_DIR)/compile_commands.json -- make build

# aliases
.PHONY: b f c u t
b: build
c: clean
u: update

GREEN = \033[0;32m
NC = \033[0m
