org 100h
.model small
.stack 100h
.data
	x db 0

.code
	mov ah,1
	int 21h
	
	mov x,al
	
	mov ah,2
	mov dl,x
	int 21h