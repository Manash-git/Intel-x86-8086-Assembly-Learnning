include 'EMU8086.INC'
org 100h
.stack 100h
.model small
linebreak macro
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	endm

.data  
 char db 0
.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	check: 
	
	print "Enter a char:: "
	mov ah,1
	int 21h
	mov char,al
    linebreak
 	  
	cmp char,'A'
	jl notalph
	cmp char,'z'
	jg notalph
	
	cmp char,'a'
	jge display
	cmp char,'Z' 
	jle display
	jg notalph 
	
	
	display:
	print "Output:: "
	mov ah,2
	mov dl,char
	int 21h
	linebreak
	jmp check
	
	notalph:
	printn "Not a Char." 
	jmp check
	
	main endp

end main