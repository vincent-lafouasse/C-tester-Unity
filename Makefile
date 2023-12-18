LIB = libcustom.a

CC = clang

SRC_DIR   = ./src
INC_DIR   = ./include
BUILD_DIR = ./build

H_FILES = $(shell find $(INC_DIR) -name '*.h')

C_FILES = $(shell find $(SRC_DIR) -name '*.c')
OBJS := $(C_FILES:%=$(BUILD_DIR)/%.o)

CFLAGS  = -Wall -Wextra
#CFLAGS += -Werror
CFLAGS += -I$(INC_DIR) 

.PHONY: all
all: build

.PHONY: build
build: $(LIB)

$(LIB): $(OBJS) $(H_FILES)
	@echo Building lib
	@ar rcs $(LIB) $(OBJS)

$(BUILD_DIR)/%.c.o: %.c $(H_FILES)
	@echo Compiling $<
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@echo Cleaning up object files
	@rm -rf $(BUILD_DIR)

.PHONY: fclean
fclean: clean
	@echo Cleaning up lib
	@rm -rf $(LIB)

.PHONY: re
re: fclean $(LIB)

.PHONY: test
test: $(LIB)
	@make -C test

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
t: test

