#include "api.h"
#include "keycode_lut.h"

int gl_print_int(int val, vchar col, int x, int y) {
	char digits[20] = {[0 ... 18] = '0', 0};
	int i;

	for(i = 0; i < 20 && val; i++) {
		digits[20 - i - 2] = (val % 10) + '0';
		val /= 10;
	}

	kwrite(digits, col, x, y);
}

byte gl_keycode_to_char(int keycode) {
	return (byte)keycode_lut[keycode];
}
