#include "kernel.h"

int kmain(void) {
	//*vga_base_addr = '@';
	char buff[] = "This is a message from the C kernel.";

	vchar back_col = { .background = 1 };
	vchar some_col = {
		.foreground = 3,
		.background = 0,
		.blink = 0
	};

	kclear_screen(back_col);
	kputs(buff, some_col, 0, 2);
}
