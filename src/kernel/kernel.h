#ifndef __GLKERNEL_H__
#define __GLKERNEL_H__

#define VGA_WIDTH 80
#define VGA_HEIGHT 25

#define VGA_ADDR (word*)0xb8000

typedef unsigned char byte;
typedef unsigned short word;

typedef struct {
	byte char_code;
	byte foreground : 4;
	byte background : 3;
	byte blink	: 1;
} vchar;

word vchar_to_word(vchar vc);

int kputs(const char *str, vchar attr, int x, int y);
void kclear_screen(vchar attr);

#endif //__GLKERNEL_H__
