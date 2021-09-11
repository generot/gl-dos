; Subroutine, abusing the BIOS 'write' interrupt.
; bx - address to the beginning of the 'to-be-printed' string
puts:
	mov ah, 0x0e

puts_lp:
	mov al, [bx]
	cmp al, 0
	je puts_end
	
	int 0x10
	inc bx
	jmp puts_lp

puts_end:
	mov ah, 0x0e

	mov al, 10	; \n
	int 0x10

	mov al, 13	; \r
	int 0x10

	ret
