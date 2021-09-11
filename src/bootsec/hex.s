; Kinda shitty implementation, but it does the job.
; dx - the number to be represented

%define HEX_MASK 0x000F

hex:
	pusha
	mov bx, hstr
	add bx, 2

	ror dx, 12

hex_loop:
	mov al, [bx]
	cmp al, 0
	je hex_end

	mov cx, dx
	and cx, HEX_MASK	

	push bx

	mov bx, symbols
	add bx, cx
	mov cl, [bx]

	pop bx

	mov [bx], cl

	inc bx
	rol dx, 4
	jmp hex_loop
	
hex_end:
	popa
	ret

puthex:
	mov bx, hstr
	call puts
	ret

symbols: db "0123456789ABCDEF", 0
hstr: db "0x0000", 0
