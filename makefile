QEMU=qemu-system-x86_64
QEMULIB="C:\Program Files\qemu"

ASM=nasm
AFLAGS=-fbin

SRC=src
BIN=bin

run: $(BIN)/img.bin
	$(QEMU) -drive format=raw,file=$< -L $(QEMULIB)

img: $(SRC)/boot.s
	$(ASM) $(AFLAGS) -o $(BIN)/img.bin $< -I $(SRC)
