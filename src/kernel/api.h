#ifndef __GL_API__
#define __GL_API__

#include "kernel.h"

typedef unsigned long int gl_size;

int gl_printf(const char *fmt, void *args, gl_size n);
int gl_print_int(int val, vchar col, int x, int y);

byte gl_keycode_to_char(int keycode);

#endif //__GL_API__

