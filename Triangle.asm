.model small
.stack 100h
.code
main proc
        mov bh,3
        mov bl,0
        MOV AH,2
    loop_1:
        cmp bh,0
        je END_1
        MOV BL,0
    LOOP_2:
        CMP BL,BH
        JAE END_2
        MOV DL,'*'
        INT 21H
        INC BL
        JMP LOOP_2
    END_2:
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        DEC BH
        JMP LOOP_1
    END_1:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
        END MAIN