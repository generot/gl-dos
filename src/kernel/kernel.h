#ifndef __GLKERNEL_H__
#define __GLKERNEL_H__

#define GL_VERSION_MAJOR 0
#define GL_VERSION_MINOR 4

#define GL_WELCOME_MSG(major, minor)	\
	"GL-DOS v."#major"."#minor" - Ring 0(Kernel space). "	\
	"Welcome, hope you have a nice time!"

#define GL_EXPAND_WLC(mj, mn)	\
	GL_WELCOME_MSG(mj, mn)

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
