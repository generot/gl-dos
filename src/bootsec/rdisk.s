; dx - Info about the operated drive:
; 	- dh: sectors to be read
;	- dl: drive number
; Remarks: ES and BX are managed on the calling side.
read_disk:
	push dx

	mov ah, 0x02
	mov al, dh	; Read 'dh' sectors
	mov ch, 0	; Cylinder 0
	mov dh, 0	; Side 0
	mov cl, 2	; We skip the bootloader(aka 1st sector)

	int 0x13
	jc read_disk_err

	pop dx
	ret

read_disk_err:
	mov bx, DISK_ERR
	call puts

	ret

DISK_ERR:
	db "An error occured when reading from disk.", 0
