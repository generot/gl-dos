#include "kernel.h"
#include "api.h"

int kmain(void) {
	char buff[] = GL_EXPAND_WLC(GL_VERSION_MAJOR, GL_VERSION_MINOR);

	vchar some_col = {
		.foreground = 3,
		.background = 0,
		.blink = 0
	};

	vchar back_col = { .background = 1 };

	kclear(back_col);
	kwrite(buff, some_col, 0, 2);

	while(1) {
		char inp = kinput();
		some_col.char_code = inp;

		//kputc(some_col, 0, 10);
		gl_print_int(some_col, 0, 4);
	}
}
