[bits 16]
[org 0x7c00]

%define BOOT_STACK_TOP 0x9200

; ----- SECTOR 1: Bootloader -----
entry:
	mov [DRIVE], dl
	
	mov bp, BOOT_STACK_TOP
	mov sp, bp

	mov bx, MSG
	call puts

	call switch_32

	jmp $

%include "./puts.s"
%include "./hex.s"
%include "./rdisk.s"
%include "./enter32.s"
%include "./puts32.s"

MSG: db "Hello, world! - 16 bits", 0
DRIVE: db 0

[bits 32]
protected_mode:
	mov ebx, MSG_PROT_MODE
	call puts32

	jmp $

MSG_PROT_MODE: db "Hello, world! - 32 bits", 0

times 510 - ($ - $$) db 0
dw 0xaa55

; ----- SECTOR 2: OS will reside here -----
;times 256 dw 0xc1ca
;times 256 dw 0x0a55
;times 256 dw 0xbeef
