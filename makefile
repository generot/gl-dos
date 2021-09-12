#Binaries
LD=ld
CC=gcc
ASM=nasm
QEMU=qemu-system-x86_64

#Flags
AFLAGS=-fbin
CFLAGS=-m32 -nostdlib -ffreestanding -fno-pie

#Directories
SRC=src
BIN=bin
QEMULIB="C:\Program Files\qemu"

KENTRY_ADDR=0x9000

run: $(BIN)/os.bin
	$(QEMU) -drive format=raw,file=$< -L $(QEMULIB)

os: kernel boot
	cat $(BIN)/boot.bin $(BIN)/kernel.bin > $(BIN)/os.bin

kernel: $(BIN)/kentry.o $(BIN)/kobj.o
	$(LD) -o $(BIN)/kernel.bin -Ttext $(KENTRY_ADDR) $^ --oformat=binary -m elf_i386

boot: $(SRC)/bootsec/boot.s
	$(ASM) $(AFLAGS) -o $(BIN)/boot.bin $< -I $(SRC)/bootsec/

$(BIN)/kentry.o: $(SRC)/kernel/kernel_entry.s
	$(ASM) -felf32 $< -o $@

$(BIN)/kobj.o: $(SRC)/kernel/kernel.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm $(BIN)/*.o $(BIN)/*.bin
