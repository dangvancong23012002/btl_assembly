INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	dir1	db 13, 10, '	       CHUC NANG TAO THU MUC'
			db 13, 10, '	------------------------------------'
			db 13, 10, '	Hay vao ten thuc muc can tao: $'
	err_dir db 13, 10, '	Khong tao duoc thu muc! $'
	suc_dir db 13, 10, '	Tao thu muc thanh cong! $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	buff 	db 40
			db ?
	dir_name db 40 dup(?)
.CODE
	PUBLIC @CRE_DIR$qv
@CRE_DIR$qv PROC
		mov ax, @data
		mov ds, ax

	L_CT0:
		clrscr
		HienString dir1
		lea dx, buff ; ds:dx trỏ đến đầu buff 
		call GET_DIR_NAME ; Gọi hàm nhận tên thư mục cần tạo 
		lea dx, dir_name ; dx trỏ đến đầu xâu chứa tên thư mục 
		mov ah, 39h ; Chức năng tạo lập thư mục 
		int 21h
		jnc L_CT1
		HienString err_dir
		jmp CONTINUE
		
	L_CT1:
		HienString suc_dir
		
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