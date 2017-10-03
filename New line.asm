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
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h 
	  
	mov dl,x
	mov ah,2
	
	int 21h