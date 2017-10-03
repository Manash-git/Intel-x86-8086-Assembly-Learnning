org 100h
.model small
.stack 100h
.data
	m db "Hello World...$"

.code
	mov ah,9
	lea dx,m
	int 21h