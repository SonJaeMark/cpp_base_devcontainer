# Compiler settings
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++11 -Ilib -fPIC

# Directories
LIB_DIR = lib
BUILD_DIR = build

# Library and executable names
LIB_NAME = libhello.so
TARGET = main

# Source files
LIB_SOURCES = $(LIB_DIR)/hello.cpp
LIB_OBJECTS = $(BUILD_DIR)/hello.o

MAIN_SOURCE = main.cpp
MAIN_OBJECT = $(BUILD_DIR)/main.o

# Build and run the executable
all: $(TARGET)
	@echo "Build successful! Running program..."
	@./$(TARGET)
	rm -rf $(BUILD_DIR) $(TARGET)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Build shared library
$(BUILD_DIR)/$(LIB_NAME): $(LIB_OBJECTS) | $(BUILD_DIR)
	$(CXX) -shared -o $@ $^

# Compile library source files
$(BUILD_DIR)/hello.o: $(LIB_DIR)/hello.cpp $(LIB_DIR)/hello.h | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile main source file
$(BUILD_DIR)/main.o: main.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link executable with shared library
$(TARGET): $(BUILD_DIR)/main.o $(BUILD_DIR)/$(LIB_NAME)
	$(CXX) $(BUILD_DIR)/main.o -L$(BUILD_DIR) -lhello -o $(TARGET) -Wl,-rpath=$(BUILD_DIR)

# Build and run
all: $(TARGET)
	@echo "Build successful! Running program..."
	@./$(TARGET)

# Clean up
clean:
	rm -rf $(BUILD_DIR) $(TARGET)
