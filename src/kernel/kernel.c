#include "kernel.h"

int kmain(void) {
	char buff[] = GL_EXPAND_WLC(GL_VERSION_MAJOR, GL_VERSION_MINOR);
	char prompt[] = ">> ";

	vchar back_col = { .background = 1 };
	vchar some_col = {
		.foreground = 3,
		.background = 0,
		.blink = 0
	};

	vchar blink_col = {
		.foreground = 3,
		.background = 1
	};

	kclear_screen(back_col);

	kputs(buff, some_col, 0, 2);
	kputs(prompt, blink_col, 0, 3);
}
