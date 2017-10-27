include 'EMU8086.INC'
org 100h
.stack 100h
.model small
.data  

.code  

main proc 
	mov ax,@data
	mov ds,ax
	
	
	print "Enter ur character:: "
	
	mov ah,1
	int 21h
	
	cmp al,'A'
	je vowel
	cmp al,'E'
	je vowel
	cmp al,'I'
	je vowel
	cmp al,'O'
	je vowel
	cmp al,'U'
	je vowel
	cmp al,'a'
	je vowel
	cmp al,'e'
	je vowel
	cmp al,'i'
	je vowel
	cmp al,'o'
	je vowel
	cmp al,'u'
	je vowel
	printn ""
	printn "Consonent."
	jmp exit
	
	vowel:
	printn ""
	printn "Vowel"
	
	exit:
	mov ah,4ch
	int 21h 
	
	main endp

end main