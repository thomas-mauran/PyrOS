ASM=nasm

SRC_FOLD=src
BUILD_DIR=build

.PHONY: floppy_image bootloader

all: floppy_image

floppy_image: $(BUILD_DIR)/main_floppy.img

$(BUILD_DIR)/main_floppy.img: bootloader
	dd if=/dev/zero of=$(BUILD_DIR)/main_floppy.img bs=512 count=2880
	mkfs.fat -F 12 -n "PYOS" $(BUILD_DIR)/main_floppy.img
	dd if=$(BUILD_DIR)/bootloader.bin of=$(BUILD_DIR)/main_floppy.img conv=notrunc

bootloader: build_dir
	$(ASM) $(SRC_FOLD)/boot.asm -f bin -o $(BUILD_DIR)/bootloader.bin

build_dir:
	mkdir -p $(BUILD_DIR)
