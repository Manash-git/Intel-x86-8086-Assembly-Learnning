include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	mov cx,6
	mov ax,1
	
	fact:
	mul cx
	loop fact
	
	print "Output:: "
	call outdec
	
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
include INDEC.ASM
end main