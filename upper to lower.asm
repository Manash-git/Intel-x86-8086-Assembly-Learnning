org 100h
.model small
.stack 199h  
.data
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		mov ah,1
		int 21h
		
		add al,32
		
		mov ah,2
		mov dl,al
		int 21h