INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	dir1	db 13, 10, '	       CHUC NANG TAO THU MUC'
			db 13, 10, '	------------------------------------'
			db 13, 10, '	Hay vao ten thuc muc can tao: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @CRE_DIR$qv
@CRE_DIR$qv PROC
		mov ax, @data
		mov ds, ax

	L_CT0:
		clrscr
		HienString dir1
		
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
	
INCLUDE lib3.asm 
@CRE_DIR$qv ENDP
	END