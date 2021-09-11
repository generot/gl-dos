[bits 32]

%define VGA_BASE_ADDR 0xb8000

%define CHAR_WD 80
%define CHAR_HT 25
%define PRINT_LN 10 * CHAR_WD

; ebx - base address of the to-be-printed string
puts32:
	pusha
	mov eax, VGA_BASE_ADDR
	mov edx, 0

puts32_begin:
	mov cl, [ebx]
	cmp cl, 0x0
	je puts32_end

	push edx
	add edx, PRINT_LN
	add edx, edx

	mov [eax + edx], cl
	pop edx

	inc edx
	inc ebx

	jmp puts32_begin

puts32_end:
	popa
	ret
