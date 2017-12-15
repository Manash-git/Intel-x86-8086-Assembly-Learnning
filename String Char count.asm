include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  
    brd db 'x23x5ox89$'
main proc 
	mov ax,@data
	mov ds,ax
	sub dx,dx
	
	mov di,0
	
	process:
	    cmp di,9
	    je print 
	    cmp brd[di],'x'
	    je count
	    cmp brd[di],'o'
	    je count
	    add di,1
	    jmp process
	    
	count:
	    add di,1
	    inc dx
	    jmp process
	    
	 print:
	    mov ax,dx
	    call outdec
	
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
end main