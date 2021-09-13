[bits 16]
[org 0x7c00]

%define BOOT_STACK_TOP 0x8000
%define KERNEL_ENTRY 0x9000
%define READ_SECTORS 9

; ----- SECTOR 1: Bootloader -----
entry:
	mov [DRIVE], dl
	
	mov bp, BOOT_STACK_TOP
	mov sp, bp

	;mov bx, MSG
	;call puts

	call load_os
	call switch_32

	jmp $

%include "./puts.s"
%include "./hex.s"
%include "./rdisk.s"
%include "./enter32.s"
%include "./puts32.s"

[bits 16]
load_os:
	mov dl, [DRIVE]		; Setting up the drive we want to read.
	mov dh, READ_SECTORS	; This has to be kept track of as the OS gets bigger.
	mov bx, KERNEL_ENTRY
	
	call read_disk
	ret


MSG: db "Entering 16-bit real mode...", 0
DRIVE: db 0

[bits 32]
protected_mode:
	;mov ebx, MSG_PROT_MODE
	;call puts32

	call KERNEL_ENTRY

	jmp $

MSG_PROT_MODE: db "Entering 32-bit protected mode...", 0

times 510 - ($ - $$) db 0
dw 0xaa55
