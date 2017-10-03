org 100h
.model small
.stack 100h  
.data
	value db 0   
	value2 db 0
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		mov ah,1
		int 21h 

		mov value,al 
		;mov value2,value
		
		cmp value,'a'
		jae LtU
		jb UtL
		
		UtL:
			add value,32
			
			mov ah,2
			mov dl,value
			int 21h     
			jmp exit
		LtU:
			sub value,32
			
			mov ah,2
			mov dl,value
			int 21h
			jmp exit
		exit:
			mov ah,4ch
			int 21h	
		
		