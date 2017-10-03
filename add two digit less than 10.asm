org 100h
.model small
.stack 100h
.data
	a db 0
	b db 0
.code
	
	mov ah,1
	int 21h
	mov a,al
	
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	
	mov ah,1
	int 21h
	mov b,al
	
	add al,a
	mov a,al
	sub a,48
	
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	
	mov ah,2
	mov dl,a
	int 21h
	