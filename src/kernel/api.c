#include "api.h"

int gl_print_int(vchar val, int x, int y) {
	char digits[20] = {[0 ... 18] = '0', 0};
	int i;

	for(i = 0; i < 20 && val.char_code; i++) {
		digits[20 - i - 2] = (val.char_code % 10) + '0';
		val.char_code /= 10;
	}

	val.char_code = 0;
	kwrite(digits, val, x, y);
}

char gl_keycode_to_char(int keycode) {
	//Unimplemented.
	return -1;
}
