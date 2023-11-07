EXEC = tests.out

BUILD_DIR = ./build
SRC_DIR = ./src

SRCS := $(shell find $(SRC_DIR) -name '*.c')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

LIBS = -lcustom
LDFLAGS = -L..

INC_DIRS = ./src/test-framework .. ./src ../include
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

###
CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall -Wextra
#CFLAGS += -Werror
CFLAGS += $(INC_FLAGS)

CFLAGS += -DUNITY_SUPPORT_64 -DUNITY_OUTPUT_COLOR


.PHONY: test
test: $(BUILD_DIR)/$(EXEC)
	@./$<

# Linking
$(BUILD_DIR)/$(EXEC): $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)

# Compile C 
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)
