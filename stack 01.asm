include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	mov ax,1234
	mov bx,5678
	mov cx,9781
	mov dx,1256
	
	push cx
	push dx
	
	pop bx 
	
	add cx,dx 
;	mov ax,cx
	xchg ax,cx
	push ax
	
	pop ax
	
	call outdec
	
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
include INDEC.ASM
end main