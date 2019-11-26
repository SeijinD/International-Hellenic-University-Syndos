TITLE ASK5
CODE SEGMENT
ASSUME CS:CODE, DS:DATA, SS:SOROS
MAIN PROC NEAR
        MOV AX, DATA
        MOV DS, AX
        
        MOV AL, N1
        ADD AL, N2
        
        MOV DL, AL
        
        CALL DISPLAY_HEX
        
        MOV AH, 4CH
        INT 21H
MAIN ENDP

DISPLAY_HEX PROC NEAR
        MOV BL, DL
        
        MOV BH, 0
        MOV CL, 4
        
        SHL BX, CL
        MOV DL, BH
        
        CALL ONE_DIGIT
        
        MOV CL, 4
        
        SHR BL, CL
        MOV DL, BL
        
        CALL ONE_DIGIT
        
        RET        
DISPLAY_HEX ENDP

ONE_DIGIT PROC NEAR
        CMP DL, 09H
        JA GRAMMA
        
        ADD DL, 48
        JMP NEXT
    GRAMMA:
        ADD DL, 'A'-10
    NEXT:
        MOV AH, 02H
        INT 21H
    TELOS:
        RET    
ONE_DIGIT ENDP

CODE ENDS

DATA SEGMENT
    N1 DB 3Fh
    N2 DB 0ACh
DATA ENDS

SOROS SEGMENT STACK
    DB 256 DUP(0)
SOROS ENDS

END MAIN