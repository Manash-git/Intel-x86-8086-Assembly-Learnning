include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	mov ax,15
	mov bx,0
	
	check:
	
	cmp ax,0
	je print
	
	test ax,1
	jz notcount
	inc bx
	
	notcount:
	
	shr ax,1
	jmp check
	
	print:
	           
	Print "NO of 1 is :: "           
	mov ax,bx
	call outdec

	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
include INDEC.ASM
end main