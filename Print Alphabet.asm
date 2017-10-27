include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  
 char db 0
.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	 
	print "Enter ur Char:: " 
	
	mov ah,2
	int 21h
	mov char,al
	
	cmp char,'A'
	jl invalid
	
	cmp char,'Z'
	
	
	cmp char,'a' 
	
    mov ah,2
    mov dl,char
    int 21h
	
	
	lower:
	cmp char,'a'
	jg exption 
	
	cmp char,'z'
	
	
	
	
	invalid:
	mov ah,4ch
	int 21h 
	
	main endp

end main