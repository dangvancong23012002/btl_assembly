INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
	m1 	db 13, 10, '	       TONG LE DAY SO NGUYEN'
		db 13, 10, '	------------------------------------'
		db 13, 10, '	Hay vao so luong thanh phan: $'
	m2 db 13, '	a[$'
	m3 db ']=$'
	m4 db 13, '	Day so vua nhap la: $'
	space db ' $'
	m5 db 13, 10, '	Tong cac thanh phan am cua mang la: $'
	tieptuc db 13, 10, '	------------------------------------'
			db 13, 10, '	Co tiep tuc chuong trinh khong(c/k)? $'
	slpt dw ?
	i dw ?
	a dw 100 dup(?)
.CODE
	PUBLIC @ODD_SUM$qv
@ODD_SUM$qv PROC
		mov ax, @data 
		mov ds, ax 
	
	L_CT0:
		clrscr
		HienString m1
		call VAO_SO_N
		mov slpt, ax 		; Cất giá trị số lượng thành phần (ax) vào biến slpt
		
	; Vòng lặp nhận các số đưa vào mảng
		mov cx, ax 			; cx = số lượng thành phần (chỉ số vòng lặp LOOP)
		lea bx, a 			; bx là con trỏ offset của a[0]
		mov i, 0 			; Gán giá trị biến nhớ i = 0
		
	L_CT1:
		HienString m2
		mov ax, i 			; Hiện giá trị i 
		call HIEN_SO_N
		HienString m3
		call VAO_SO_N 		; Nhận các giá trị thành phần a[i]
		mov [bx], ax 		; Đưa giá trị a[i] vào mảng a do bx trỏ đến
		inc i 				; Tăng giá trị i lên 1
		add bx, 2 			; bx trỏ đến thành phần tiếp theo của mảng a 
		loop L_CT1
		
	; Vòng lặp đưa các số của mảng lên màn hình
		HienString m4
		mov cx, slpt 		; cx = số lượng thành phần (chỉ số vòng lặp)
		lea bx, a			; bx trỏ đến a[0]
		
	L_CT2:
		mov ax, [bx] 		; ax = a[i]
		call HIEN_SO_N 		; Hiện giá trị a[i] lên màn hình 
		HienString space 	; Hiện dấu cách
		add bx, 2 			; bx trỏ đến thành phần tiếp theo của mảng a 
		loop L_CT2
		
	; Vòng lặp tính tổng 
		HienString m5
		mov cx, slpt 		; cx = số lượng thành phần của mảng a (chỉ số vòng lặp)
		lea bx, a 			; bx trỏ đến a[0]
		xor ax, ax 			; ax chứa tổng (lúc đầu = 0)
		
	; Tổng các thành phần âm của mảng 
	L_CT3:
		mov dx, [bx] 		; dx = a[i]
		and dx, dx 			; Dựng cờ dấu (S = 1 thì dx chứa số âm, S = 0 thì dx chứa số âm)
		jns L_CT4
		add ax, [bx] 		; Còn giá trị a[i] âm thì cộng vào tổng nằm ở ax 
		
	L_CT4:
		add bx, 2
		loop L_CT3
		
	; Hiện giá trị tổng
		call HIEN_SO_N
		
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