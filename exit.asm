.MODEL small
.CODE
	PUBLIC @EXIT$qv
@EXIT$qv PROC
	mov ah, 4ch
	int 21h
	ret
@EXIT$qv ENDP
	END