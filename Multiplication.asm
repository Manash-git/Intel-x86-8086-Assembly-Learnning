org 100h
.stack 100h
.model small
.data
.code

main proc 
    mov al,2
    mov bl,3
    mul bl
    
    
    
    mov ah,2 
    ;sub al,48
    mov dl,al
    add dl,48
   
    int 21h 
    
    
    mov ah,4ch
    int 21h 
    
    main endp
    
end main    