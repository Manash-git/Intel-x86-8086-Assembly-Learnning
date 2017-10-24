include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	printn "Type a line :: "
	mov ah,1
	int 21h 
	
	check:
		
		
		
		cmp al,0dh
		je exit 
		
		cmp al,'A'
		jl end_if
		cmp al,'Z'
		jg end_if
		
		cmp al,First
		jnl check_last
		
		mov first,al
		
		 cmp al,last
		 jng end_if
		 
		 mov last,al
		 
		 end_if:
		 	
		 	int 21h
		 	jmp check
	
exit:
	mov ah,4ch
	int 21h 
	
	main endp

end main