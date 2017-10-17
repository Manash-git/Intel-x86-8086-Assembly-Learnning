include 'EMU8086.INC'
org 100h
.model small
.stack 100h
.data
	n db 0
	rem db 0
	
.code

main proc
	mov ax,@data
	mov ds,ax
	
	mov ax,0
	
	print "Enter value:: "  
	mov ah,1
	int 21h 
	mov n,al
	printn " "
	
	mov al,n  
	sub al,'0'
	mov ah,'0'
	mov bx,2
	div bx
	
	
	mov rem,dl
	add rem,'0'
		
;	print "Remainder:: "
;	mov ah,2
;	mov dl,rem
;	int 21h
;	printn " "
	
	cmp rem,'1'
	jne even
	print "Odd Number" 
	jmp exit
	
	even:
		print "Even Number."
		jmp exit
	
	exit:  
		mov ah,4ch
		int 21h
	
	main endp

end main