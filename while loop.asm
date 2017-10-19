include 'EMU8086.INC' 
include outdec.asm

org 100h
.model small
.stack 100h
.data
.code
    
    main proc
    
    mov cx,0
    mov ah,1
    int 21h


    while:

    cmp al,0dh
    je display
    inc cx
    int 21h
    jmp while 
    
    display:
    
    mov ax,cx  
    call outdec
    
    mov ah,4ch
    int 21h
        
    main endp
main end