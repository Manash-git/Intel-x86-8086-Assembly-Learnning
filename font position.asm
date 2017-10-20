 .model small
.stack
.data

.code

;setting video mode
mov ah,0
mov al,12h
int 10h


;setting cursor position
mov ah,02h  
mov dh,10    ;row 
mov dl,40     ;column
int 10h


mov ah,09h
mov bl,0eh   ;colour
mov cx,1      ;no.of times
mov al,'B'      ;print B
int 10h   

;int 10h


 mov ah,4ch
int 21h

end