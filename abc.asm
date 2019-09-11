.model small
.data
msg1 db 0dh,0ah,"Enter the alpha numeric character"
res db 02 dup(0)
.code
        MOV AX,@data
        MOV DS,AX
        LEA DX,MSG1
        CALL Disp
        MOV AH,01H
        INT 21H
        MOV BL,AL
        MOV CL,4
        SHR AL,CL
        CMP AL,0AH
        JC Digit
        ADD AL,07

        Digit:  ADD AL,30H
                MOV res,AL
                AND BL,0FH
                CMP BL,0AH
                JC Digit1
                ADD AL,07

        Digit1: ADD BL,30H
                MOV res+1,BL
                MOV AH,00H
                MOV AL,03H
                INT 10H
                MOV AH,02H
                MOV BH,00H
                MOV DH,0CH
                MOV DL,28H
                INT 10H
                MOV res+2,'$'
                LEA DX,res
                Call disp
                MOV AH,4CH
                INT 21H
disp proc near
MOV AH,09H
INT 21H
RET
disp endP
END
       
