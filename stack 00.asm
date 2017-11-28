include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	 
	mov ax,1236
	mov bx,5676
	mov cx,7245
	
	push ax
	push bx
	xchg ax,cx
	push ax
	
	pop bx
	mov ax,bx
	
	call outdec 
	
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
end main