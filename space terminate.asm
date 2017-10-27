include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	space:
	mov ah,1
	int 21h
	
	cmp al,' '
	je exit
	loop space
	
	exit:
	mov ah,4ch
	int 21h 
	
	main endp

end main