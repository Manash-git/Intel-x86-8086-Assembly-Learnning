include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	 
	print "Enter 1st number:: "
	call indec
	mov bx,ax
	
	Printn ""
	Print "Enter second number:: "
	call indec
	
	mul bx
	
	printn ""
	print "Output:: "   
	call outdec
	
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
include INDEC.ASM
end main