include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	
	mov ah,4ch
	int 21h 
	
	main endp

end main