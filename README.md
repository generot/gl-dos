# Generally Lightweight DOS
The Generally Lightweight Disk Operating System(GL-DOS, for short) is a simplistic 32-bit operating system with its own bootloader(no GRUB or anything), a pet project of mine.

## Implemented and coming features
The following features are what came off the top of my head at the time of writing this. After that's done, I might work
on additional(optional) features for the OS, although I will most likely not complicate it much, since I never planned for this to become an actual useful OS.

- [x] Bootloader
- [x] Real-mode I/O routines
- [x] Switch to Protected mode
- [x] Protected-mode I/O routines
- [x] Basic kernel
- [ ] Write syscalls for the kernel
- [ ] Keyboard I/O
- [ ] Basic graphics

## How to run
To run GL-DOS, you need the following tools:
- [GNU Make](https://www.gnu.org/software/make/)
- [The Netwide Assembler](https://www.nasm.us/)
- [QEMU](https://www.qemu.org/)

Unlike most of my other projects, this one is compiled on WSL(Windows subsystem for Linux). Since GL-DOS will be emulated using QEMU, you shouldn't worry about any possible incompatibilities when compiling on either Linux, Windows or MacOS, since neither of the two will be directly running any code(QEMU will be doing that). You just need the aforementioned tools and you're all set.
