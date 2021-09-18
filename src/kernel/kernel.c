#include "kernel.h"
#include "api.h"

#define MAX_SHELL_LINE 256

int kmain(void) {
	char buff[] = GL_EXPAND_WLC(GL_VERSION_MAJOR, GL_VERSION_MINOR);
	char shell_buff[MAX_SHELL_LINE] = {0};

	int shell_ix = 0;

	vchar some_col = {
		.foreground = 3,
		.background = 0,
		.blink = 0
	};

	vchar back_col = { .background = 1 };

	kclear(back_col);
	kwrite(buff, some_col, 0, 2);

	while(1) {
		int inp = kinput();
		if(inp < 144) {
			shell_buff[shell_ix++] = gl_keycode_to_char(inp);
			ksleep(180000 * 128);
		}

		kwrite(shell_buff, some_col, 0, 4);
		//kputc(some_col, 0, 10);
		//gl_print_int(inp, some_col, 0, 4);
	}
}
