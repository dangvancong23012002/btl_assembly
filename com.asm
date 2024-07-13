INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	com1 	db 13, 10, '	              CONG COM'
			db 13, 10, '	------------------------------------'
			db 13, 10, '	May tinh dang dung co cong COM khong? $'
	co db 'Co $'
	khong db 'Khong $'
	com2	db 13, 10, '	So luong cong COM la: $'
	com3	db 13, 10, '	Dia chi cac cong com la: $'
	space db ' $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
.CODE
	PUBLIC @COM$qv
@COM$qv PROC
		mov ax, @data
		mov ds, ax 
		
	L_CT0:
		CLRSCR
		HienString com1
		int 11h ; Ngắt hệ thống thực hiện việc đưa nội dung ô nhớ [0:411h] -> al 
		mov al, ah ; Đưa nội dung 0:411h -> ah 
		and al, 00001110b ; Tách 3 bit chứa số lượng cổng COM 
		shr al, 1 ; al = số lượng cổng COM 
		jnz L_CT1 ; Nếu al khác 0 (có cổng COM thì nhảy)
		HienString khong
		jmp CONTINUE
		
	L_CT1:
		HienString co
		mov cl, al 
		xor ch, ch 
		HienString com2
		add al, 30h ; al là mã ASCII số lượng cổng COM 
		mov ah, 0eh ; Chức năng hiện 1 ký tự ASCII lên màn hình 
		int 10h 
		HienString com3
		xor ax, ax 
		mov es, ax 
		mov bx, 400h ; es:bx = 0:400h (nơi chứa địa chỉ cổng COM1)
		
	L_CT2:
		mov ax, es:[bx] 
		call HIEN_HEXA ; Hiện giá trị HEXA lên màn hình 
		HienString space
		add bx, 2 ; bx trỏ đến cổng COM thứ 2 
		loop L_CT2
		
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
@COM$qv ENDP
	END