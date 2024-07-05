INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	     TONG LE DAY SO NGUYEN'
		db 13, 10, '	-------------------------------'
		db 13, 10, '	Hay vao so luong thanh phan: $'
	m2 db 13, '	a[$'
	m3 db ']=$'
	m4 db 13, 'Day so vua nhap la: $'
	m5 db ' $'
	tieptuc db 13, 10, '	-------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k) $?'
.CODE
	PUBLIC @ODD_SUM$qv
@ODD_SUM$qv PROC
		mov ax, @data 
		mov ds, ax 
	
	L_CT0:
		clrscr
		HienString m1
		call VAO_SO_N
		
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
	
INCLUDE lib2.asm 
@ODD_SUM$qv ENDP
	END