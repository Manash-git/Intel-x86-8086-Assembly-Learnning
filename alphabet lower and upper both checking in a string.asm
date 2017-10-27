.stack 100h
.data

buff db 'aB[C*E-G^h#$'

lower_counter dw 0 ;COUNTER FOR LOWERCASE LETTERS.
upper_counter dw 0 ;COUNTER FOR UPPERCASE LETTERS.

msj1 db 13,10,'lowercase letters : $'
msj2 db 13,10,'uppercase letters : $'

str db 6 dup('$') ;STRING TO STORE NUMBER. 

.code          
;INITIALIZE DATA SEGMENT.
  mov  ax,@data
  mov  ds,ax

  mov   bx, offset buff    
cykluss:   
  mov al, [bx]   ;reading all characters
  inc bx           ;increasing char in string
  cmp al,'$'       ; end of line?
  je supp 

;---CHECK LETTERS ON THE EXTREMES ('A','z').

  cmp al,'A'  ; if char < 'A' then IT'S NOT A LETTER.
  JL cykluss
  cmp al,'z'  ; if char > 'z' then IT'S NOT A LETTER.
  JG cykluss  ; if char > 'z' then go to the start(cykluss)

;---CHECK LETTERS IN THE MIDDLE ('Z','a').  
;---REMEMBER : IF NEXT LINES ARE EXECUTED, IT MEANS "AL"
;---HOLDS A VALUE BETWEEN 'A' AND 'z' (65..122).                                                        

  cmp al,'a'
  JGE its_lowercase ; if char >= 'a' then IT'S A LOWERCASE LETTER.
  CMP al,'Z'
  JLE its_uppercase ; if char =< 'Z' then IT'S AN UPPERCASE LETTER.
  jmp cykluss      ; if (char > 'Z') and (char < 'a') then IT'S NOT A LETTER.

its_lowercase:  
  inc lower_counter
  jmp cykluss
its_uppercase:  
  inc upper_counter
  jmp cykluss                              

supp:
;DISPLAY TOTAL LOWERCASE.
  mov ah, 9
  mov dx, offset msj1
  int 21h

  call dollars
  mov ax, lower_counter ;PARAMETER FOR NUMBER2STRING.
  call number2string ;RESULT RETURNS IN "STR".

  mov ah, 9
  mov dx, offset str
  int 21h

;DISPLAY TOTAL UPPERCASE.
  mov ah, 9
  mov dx, offset msj2
  int 21h

  call dollars
  mov ax, upper_counter ;PARAMETER FOR NUMBER2STRING.
  call number2string ;RESULT RETURNS IN "STR".

  mov ah, 9
  mov dx, offset str
  int 21h

;FINISH THE PROGRAM.
  mov  ax,4c00h
  int  21h           

;------------------------------------------

;NUMBER TO CONVERT MUST ENTER IN AX.
;ALGORITHM : EXTRACT DIGITS ONE BY ONE, STORE
;THEM IN STACK, THEN EXTRACT THEM IN REVERSE
;ORDER TO CONSTRUCT STRING.

proc number2string
  mov  bx, 10 ;DIGITS ARE EXTRACTED DIVIDING BY 10.
  mov  cx, 0 ;COUNTER FOR EXTRACTED DIGITS.
cycle1:       
  mov  dx, 0 ;NECESSARY TO DIVIDE BY BX.
  div  bx ;DX:AX / 10 = AX:QUOTIENT DX:REMAINDER.
  push dx ;PRESERVE DIGIT EXTRACTED FOR LATER.
  inc  cx ;INCREASE COUNTER FOR EVERY DIGIT EXTRACTED.
  cmp  ax, 0  ;IF NUMBER IS
  jne  cycle1 ;NOT ZERO, LOOP. 
;NOW RETRIEVE PUSHED DIGITS.
  mov  si, offset str
cycle2:  
  pop  dx        
  add  dl, 48 ;CONVERT DIGIT TO CHARACTER.
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
endp  

;------------------------------------------
;FILLS VARIABLE STR WITH '$'.
;USED BEFORE CONVERT NUMBERS TO STRING, BECAUSE
;THESE STRINGS WILL BE DISPLAYED.
proc dollars                 
  mov  si, offset str
  mov  cx, 6
six_dollars:      
  mov  al, '$'
  mov  [ si ], al
  inc  si
  loop six_dollars
  ret
endp  