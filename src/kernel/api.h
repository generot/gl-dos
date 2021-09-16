#ifndef __GL_API__
#define __GL_API__

#define UP_DOWN_DIFF 128

#include "kernel.h"

typedef unsigned long int gl_size;

int gl_printf(const char *fmt, void *args, gl_size n);
int gl_print_int(vchar val, int x, int y);

char gl_keycode_to_char(int keycode);

#endif //__GL_API__

