    
; cmd command for finding color code color /?
; example::   C:\Users\Wolf>color /?


;    0 = Black       8 = Gray
;    1 = Blue        9 = Light Blue
;    2 = Green       A = Light Green
;    3 = Aqua        B = Light Aqua
;    4 = Red         C = Light Red
;    5 = Purple      D = Light Purple
;    6 = Yellow      E = Light Yellow
;    7 = White       F = Bright White


	; YellowOnBlue     ::  1Eh
	; Screen 	::  Blue    (1)
	; Font Color::  Yellow  (E)


include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	
	
	MOV AH, 06h    ; Scroll up function
	XOR AL, AL     ; Clear entire screen
	XOR CX, CX     ; Upper left corner CH=row, CL=column
	MOV DX, 184FH  ; lower right corner DH=row, DL=column 
	;MOV BH, 1Eh    ; YellowOnBlue   
	;MOV BH, 0ah     ; 0nh  here n= 1,2,3,.....9,a,b,c,d,e,f   for deffrent font color
	mov BH,70h
	INT 10H
	 
	printn "Hello World"  
	
	MOV AH, 06h    ; Scroll up function
	XOR AL, AL     ; Clear entire screen
	XOR CX, CX     ; Upper left corner CH=row, CL=column
	MOV DX, 184FH  ; lower right corner DH=row, DL=column 
	;MOV BH, 1Eh    ; YellowOnBlue   
	;MOV BH, 0ah     ; 0nh  here n= 1,2,3,.....9,a,b,c,d,e,f   for deffrent font color
	mov BH,17h       ; 0mh here m=  1,2,3,.....9,a,b,c,d,e,f   for deffrent screen color color
	INT 10H
	
	printn "Manash Mondal"
	 
	mov ah,4ch
	int 21h 
	
	main endp

end main