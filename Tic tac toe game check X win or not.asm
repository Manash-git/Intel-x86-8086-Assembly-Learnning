include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  
    brd db 'x23x56x89$'
main proc 
	mov ax,@data
	mov ds,ax
	
	mov si,0
	;sub si,si
	mov bx,0

row:
    cmp bx,3
    je col
    cmp brd[si],'x'
    jne next    
    cmp brd[si+1],'x'
    jne next
    cmp brd[si+2],'x' 
    je win
    jne next
    
    next:
    add si,3
    inc bx
    jmp row
    
    
col:
    cmp bx,6
    je cor1
    cmp brd[di],'x'
    jne next1    
    cmp brd[di+3],'x'
    jne next1
    cmp brd[di+6],'x'
    je win 
    jne next1
    
    next1:
    add di,1
    inc bx   
    jmp col
    
cor1:
    
    cmp brd[0],'x'
    jne cor2  
    cmp brd[4],'x'
    jne cor2 
    cmp brd[8],'x'
    je win

cor2:
    
    cmp brd[2],'x'
    jne return  
    cmp brd[4],'x'  
    jne return 
    cmp brd[6],'x'
    je win 
    
    
return:
    print "Tie"	
	jmp exit
win:
    print "X WIN."
    	
exit:
	mov ah,4ch
	int 21h 
	
	main endp
include outdec.asm
end main