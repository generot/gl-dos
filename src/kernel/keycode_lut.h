#ifndef __KEY_LUT_H__
#define __KEY_LUT_H__

#define MAX_LUT_SZ 251

//Very naive implementation,
//but it will do the job for now.
static char keycode_lut[MAX_LUT_SZ] = {
	//First row(BEGIN)
	[16] = 'q',
	[17] = 'w',
	[18] = 'e',
	[19] = 'r',
	[20] = 't',
	[21] = 'y',
	[22] = 'u',
	[23] = 'i',
	[24] = 'o',
	[25] = 'p',
	[26] = '[',
	[27] = ']',
	//First row(END)
	//Second row(BEGIN)
	[30] = 'a',
	[31] = 's',
	[32] = 'd',
	[33] = 'f',
	[34] = 'g',
	[35] = 'h',
	[36] = 'j',
	[37] = 'k',
	[38] = 'l',
	[39] = ';',
	[40] = '\'',
	//Second row(END)
	//Third row(BEGIN)
	[44] = 'z',
	[45] = 'x',
	[46] = 'c',
	[47] = 'v',
	[48] = 'b',
	[49] = 'n',
	[50] = 'm',
	[51] = ',',
	[52] = '.',
	[53] = '/',
	//Third row(END)
	[57] = ' '
};


#endif //__KEY_LUT_H__
