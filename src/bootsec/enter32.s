%include "./gdt.s"

%define STACK_TOP 0x90000

; We have:
; - a CODE_SEGMENT macro
; - a DATA_SEGMENT macro

; Transition to 32-bit Protected mode.
switch_32:
	cli		; Clear BIOS interrupts
	lgdt [gdt_desc] ; Load GDT

	mov eax, cr0	; Set the first bit of the Control register
	or eax, 1
	mov cr0, eax

	jmp CODE_SEGMENT:enter_pm

[bits 32]
enter_pm:
	mov eax, DATA_SEGMENT

	; Set all of our segment registers to the new DATA_SEGMENT
	mov ss, ax
	mov es, ax
	mov ds, ax
	mov fs, ax
	mov gs, ax

	mov ebp, STACK_TOP
	mov esp, ebp

	; This label will be defined in 'boot.s'
	call protected_mode
