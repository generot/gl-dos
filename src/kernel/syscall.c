#include "kernel.h"

word vchar_to_word(vchar vc) {
	word res = 0;

	res = ((word)vc.char_code  << 0)  | 
	      ((word)vc.foreground << 8)  |
	      ((word)vc.background << 12) |
	      ((word)vc.blink	   << 15);

	return res;
}

int kputc(vchar c, int x, int y) {
	word *const vga_base_addr = VGA_ADDR;
	int offset = x + y * VGA_WIDTH;

	vga_base_addr[offset] = vchar_to_word(c);
}

int kwrite(const char *str, vchar attr, int x, int y) {
	word *const vga_base_addr = VGA_ADDR;
	int init_x = x;

	while(*str) {
		int offset = x + y * VGA_WIDTH;
		attr.char_code = *str++;

		*(vga_base_addr + offset) = vchar_to_word(attr);
		x++;
	}

	return x - init_x;
}

void ksleep(unsigned long long dur) {
	while(dur--) {
		asm volatile("nop\n");
	}
}

dword kinput(void) {
	dword keycode = 0;
	
	asm volatile (
		"in $0x60, %%eax\n"
		"movl %%eax, %0\n"
		: "=r" (keycode)
		:
		: "eax"
	);

	return keycode % 256;
}

void kclear(vchar attr) {
	word *const vga_base_addr = VGA_ADDR;

	for(int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++)
		*(vga_base_addr + i) = vchar_to_word(attr);

	return;
}
