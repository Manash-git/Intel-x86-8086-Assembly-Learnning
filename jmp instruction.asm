.code
main proc
	
	first:
	mov ah,2
	mov dl,4
	add dl,48
	int 21h
	jmp second
	
	second:
	mov ah,2
	mov dl,9
	add dl,48
	int 21h
	jmp first
	