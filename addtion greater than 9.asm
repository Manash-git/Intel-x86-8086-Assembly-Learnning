org 100h
.model small
.stack 100h 
.data
	msgA db "Enter First Digit :: $"
	msgB db 10,13,"Enter Second Digit :: $"
	msgSum db 10,13,"Sum ::  $"  	
	a db 0
	b db 0
	;sum db 0
.code
	mov ax,@data
	mov ds,ax
	
	mov ah,9
	lea dx,msgA
	int 21h
	
	mov ah,1
	int 21h   
	sub al,48
	mov a,al 
	
	mov ah,9
	lea dx,msgB
	int 21h
	
	mov ah,1
	int 21h
	sub al,48
	mov b,al
	
	add al,a                   
	mov ah,0
	aaa
	
	add ah,48
	add al,48
	
	mov bx,ax
	
	mov ah,9
	lea dx,msgSum
	int 21h
	
	mov ah,2
	mov dl,bh
	int 21h
	
	mov ah,2
	mov dl,bl
	int 21h
	ret 