#define VGA_WIDTH 80
#define VGA_HEIGHT 25

char *const vga_base_addr = (char*)0xb8000;

int kputs(const char *str, int x, int y) {
	int init_x = x;

	while(*str) {
		int offset = 2 * (x + y * VGA_WIDTH);
		*(vga_base_addr + offset) = *str++;

		x++;
	}

	return x - init_x;
}

void test_print(void) {
	char *str = vga_base_addr;
	char my_str[] = "Hello, world";

	for(int i = 0; my_str[i]; i++) {
		*str = my_str[i];
		str += 2;
	}

	return;
}

int kmain(void) {
	*vga_base_addr = '@';
	char buff[] = "This is a message from the C kernel.";

	kputs(buff, 0, 11);
	//test_print();
}
