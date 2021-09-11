%define SEGMENT_MAX 0xFFFF

gdt_begin:

gdt_null_desc:
	dd 0x0
	dd 0x0

gdt_code_seg:
	dw SEGMENT_MAX	; Segment limit
	dw 0x0		; Base(1st 2 bytes)
	db 0x0		; Base(3rd byte)
	; --FLAGS--
	; First byte:
	; 1 -> present <=> 00 -> privilege(ring 0) <=> 1 -> type(code/data)
	; 1 -> (is_code) <=> 0 -> conforming <=> 1 -> readable <=> 0 -> accessed
	; Second byte:
	; 1 -> granularity <=> 1 -> 32-bit code <=> 0 - 64-bit code <=> 0 - debugging(AVL)
	; Remaining flags are all set.
	db 10011010b
	db 11001111b
	db 0x0		; Base(Last [4th] byte)

gdt_data_seg:
	dw SEGMENT_MAX	; Segment limit
	dw 0x0		; Base(1st 2 bytes)
	db 0x0		; Base(3rd byte)
	; --FLAGS--
	; Identical to the code segment,
	; the only exception is the 6th bit(segment type, 'data' in this case)
	db 10010010b
	db 11001111b
	db 0x0		; Base(Last [4th] byte)

gdt_end: ; We'll calculate the size of the GDT with this label.

gdt_desc:
	dw gdt_end - gdt_begin - 1	; Size of the entire structure
	dd gdt_begin			; Base address

CODE_SEGMENT equ gdt_code_seg - gdt_begin
DATA_SEGMENT equ gdt_data_seg - gdt_begin
