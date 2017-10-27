include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  
 first db '['  
 last db '@'
 nocap_msg db 10,13,"No capital.$"
 cap_msg db 10,13,"Capital exits. $"
 
 
.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	print "Type a line :: "
	mov ah,1
	int 21h 
	
	while:
		
		
		
		cmp al,0dh
		je end_while 
		
		cmp al,'A'
		jl end_if
		cmp al,'Z'
		jg end_if
		
		cmp al,First
		jnl check_last
		
		mov first,al
		
		check_last: 
		
		 	cmp al,last
		 	jng end_if
		 
		 	mov last,al
		 
		 end_if:
		 	
		 	int 21h
		 	jmp while
	    
	  end_while: 
	  
	    mov ah,9
	    
	    cmp first,'['
	    jne cap
	    
	    lea dx,nocap_msg
	    
	    jmp display
	    
	    cap:
	    	lea dx,cap_msg 
	    	int 21h
	    	
	    	printn ""
	    	print "First:: "
	    	mov ah,2
	    	mov dl,first
	    	int 21h 
	    	printn ""
	    	
	    	print "Last:: "
	    	mov ah,2
	    	mov dl,last
	    	int 21h
	    	
	    	jmp exit
	    	
	    display:
	    	int 21h
	    
	    
exit:
	mov ah,4ch
	int 21h 
	
	main endp

end main