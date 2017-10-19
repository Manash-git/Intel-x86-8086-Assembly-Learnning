org 100h
.model small
.stack 100h
.data
   char db 0
   
.code

main proc
    mov ax,@data
    mov ds,ax
            
    mov al,'*'
    
    mov cx,5
    
    mov bx,0
    
    loop1:
        cmp cx,bx
        je exit 
        
        mov ah,2
        mov dl,'*'
        int 21h 
        
       inc bx
        loop loop1
        
  
  
    exit:
        mov ah,4ch
        int 21h  