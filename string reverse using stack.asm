include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	print "Enter the String :: "
	
	xor cx,cx
	mov ah,1
	
	read:
	
	int 21h
	cmp al,0dh
	je print_msg
	inc cx
	push ax
	jmp read
	
	
	print_msg:
	
	printn ""
	print "Reverse String is :: "
	jmp display
	
	display:
	
	jcxz exit
	mov ah,2
	pop dx 
	int 21h
	loop display
	
	exit:
	
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
include INDEC.ASM
end main