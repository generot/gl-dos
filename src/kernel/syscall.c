#include "kernel.h"

word vchar_to_word(vchar vc) {
	word res = 0;

	res = ((word)vc.char_code  << 0)  | 
	      ((word)vc.foreground << 8)  |
	      ((word)vc.background << 12) |
	      ((word)vc.blink	   << 15);

	return res;
}

int kputs(const char *str, vchar attr, int x, int y) {
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

void kclear_screen(vchar attr) {
	word *const vga_base_addr = VGA_ADDR;

	for(int i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++)
		*(vga_base_addr + i) = vchar_to_word(attr);

	return;
}
