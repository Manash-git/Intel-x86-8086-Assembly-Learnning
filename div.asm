include 'EMU8086.INC'
org 100h
.model small
.stack 100h
.data
	n db 0
	
.code

main proc
	mov ax,@data
	mov ds,ax
	
	mov ax,0
	
	print "Enter value:: "  
	mov ah,1
	int 21h 
	;mov n,al
	printn " "
	
	;mov al,n  
	sub al,'0'
	mov ah,'0'
	mov bx,2
	div bx
	
	mov cl,al
	mov ch,dl
	
	add cl,'0'
	add ch,'0'
	
	print "Result:: "
	mov ah,2
	mov dl,cl
	int 21h
	printn " "
	
	print "Remainder:: "
	mov ah,2
	mov dl,ch
	int 21h
	
	
	main endp

end main