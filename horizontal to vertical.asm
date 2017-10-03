org 100h
.model small
.stack 100h
.data
	x db 0
	y db 0
	z db 0
    
    input db "Imput:: $"  
    output db 10,13,"Output::$"
.code
	main proc 
		
		; input taken
		
		mov ah,9
		lea dx,input
		int 21h
		   
		mov ah,1
		int 21h
		mov x,al    
		
		mov ah,1
		int 21h
		mov y,al
		
		mov ah,1
		int 21h
		mov z,al
	    
	    ; output print
	    
	    mov ah,9
		lea dx,output          ; output message
		int 21h         
		
		
     
	    mov ah,2
	    mov dl,x       ; A
	    int 21h
	    
	    mov ah,2
	    mov dl,0dh     
	    int 21h 
	    mov dl,0ah 
	    int 21h
	    mov dl,09h 
	    int 21h
	    
	    mov ah,2
	    mov dl,y        ; B
	    int 21h
	    
	    mov ah,2
	    mov dl,0dh     
	    int 21h 
	    mov dl,0ah 
	    int 21h
	    mov dl,09h 
	    int 21h
	    
	    mov ah,2        ; C
	    mov dl,z
	    int 21h
	  
	    
	     
	mov ah,4ch
	int 21h	