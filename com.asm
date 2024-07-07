INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	com1 	db 13, 10, '	              CONG COM'
			db 13, 10, '	------------------------------------'
			db 13, 10, '	So luong cong COM la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @COM$qv
@COM$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		clrscr
		HienString com1
		
	CONTINUE:
		HienString tieptuc
		mov ah, 1
		int 21h
		cmp al, 'c'
		jne Exit
		jmp L_CT0
		
	Exit:
		mov ah, 4ch
		int 21h
	ret
@COM$qv ENDP
	END