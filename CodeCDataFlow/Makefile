# Define variables
CLANG=clang
OPT=opt
DOT=dot
LLC=llc
SYSROOT=/opt/riscv/riscv32-unknown-elf
GCC_TOOLCHAIN=/opt/riscv
TARGET=riscv32
MARCH=rv32gc
LD=/opt/riscv/bin/riscv32-unknown-elf-ld
CFILE ?= FIR.c
LLFILE=$(CFILE:.c=.ll)
ASMFILE=$(CFILE:.c=.s)
EXEC=$(CFILE:.c=)
DOT_DIR=dot_files
PNG_DIR=png_files

# Default target
all: $(EXEC) build-png

# Rule to generate .ll from .c
$(LLFILE): $(CFILE)
	$(CLANG) -O0 -S  -emit-llvm --sysroot=$(SYSROOT) --gcc-toolchain=$(GCC_TOOLCHAIN) --target=$(TARGET) -march=$(MARCH) $< -o $@

# Ensure DOT_DIR exists
$(DOT_DIR):
	mkdir -p $(DOT_DIR)

# Rule to generate .dot files from .ll
build-dot: $(LLFILE) | $(DOT_DIR)
	$(OPT) -passes=dot-cfg $< -o /dev/null
	@if find . -maxdepth 1 -name "*.dot" -o -name ".*.dot" | grep -q dot; then \
		find . -maxdepth 1 -name "*.dot" -exec mv {} $(DOT_DIR)/ \; ; \
		find . -maxdepth 1 -name ".*.dot" -exec mv {} $(DOT_DIR)/ \; ; \
	else \
		echo "No .dot files generated."; \
	fi

# Rule to generate PNGs from DOT files
$(PNG_DIR)/%.png: $(DOT_DIR)/%.dot | $(PNG_DIR)
	$(DOT) -Tpng -o $@ $<

# Ensure PNG_DIR exists
$(PNG_DIR):
	mkdir -p $(PNG_DIR)

# Find all .dot and .png files
DOT_FILES := $(wildcard $(DOT_DIR)/*.dot $(DOT_DIR)/.*.dot)
PNG_FILES := $(patsubst $(DOT_DIR)/%.dot, $(PNG_DIR)/%.png, $(DOT_FILES))

# Rule to generate PNGs
build-png: build-dot $(PNG_FILES)

# Rule to generate .s from .ll
$(ASMFILE): $(LLFILE)
	$(LLC) -filetype=asm $< -o $@

# Rule to generate the final executable from .s
$(EXEC): $(ASMFILE)
	$(CLANG)  -g --sysroot=$(SYSROOT) --gcc-toolchain=$(GCC_TOOLCHAIN) -fuse-ld=$(LD) --target=$(TARGET) -march=$(MARCH) $< -o $@

# Phony targets for partial builds
build-ll: $(LLFILE)

build-asm: $(ASMFILE)

clean:
	rm -f $(LLFILE) $(ASMFILE) $(EXEC)
	rm -rf $(DOT_DIR) $(PNG_DIR)

.PHONY: all build-ll build-asm build-dot build-png clean
