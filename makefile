#Binaries
LD=ld
CC=gcc
ASM=nasm
QEMU=qemu-system-x86_64

#Flags
AFLAGS=-fbin
CFLAGS=-Os -m32 -nostdlib -ffreestanding -fno-pie
LFLAGS=--oformat=binary -m elf_i386

#Directories
SRC=src
BIN=bin
QEMULIB="C:\Program Files\qemu"

CINCLUDE=$(wildcard $(SRC)/kernel/*.h)
COBJ=$(patsubst $(SRC)/kernel/%.c, $(BIN)/%.o, $(wildcard $(SRC)/kernel/*.c))

KENTRY_ADDR=0x9000

run: $(BIN)/os.bin
	qemu-img resize -f raw $< +5K
	$(QEMU) -drive format=raw,file=$< -L $(QEMULIB)

os: kernel boot
	cat $(BIN)/boot.bin $(BIN)/kernel.bin > $(BIN)/os.bin

kernel: $(BIN)/kentry.o $(COBJ)
	$(LD) -o $(BIN)/kernel.bin -Ttext $(KENTRY_ADDR) $^ $(LFLAGS)

boot: $(SRC)/bootsec/boot.s
	$(ASM) $(AFLAGS) -o $(BIN)/boot.bin $< -I $(SRC)/bootsec/

$(BIN)/kentry.o: $(SRC)/kernel/kernel_entry.s
	$(ASM) -felf32 $< -o $@

$(BIN)/%.o: $(SRC)/kernel/%.c $(CINCLUDE)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: rmbin rmobj

rmbin:
	rm $(BIN)/*.bin

rmobj:
	rm $(BIN)/*.o
