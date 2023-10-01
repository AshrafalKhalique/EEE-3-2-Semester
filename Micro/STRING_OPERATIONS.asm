.MODEL SMALL
.STACK 100
.DATA
STRING1 DB 'ASHRAF'
STRING2 DB 6 DUP (?)
.CODE
    MAIN PROC NEAR
        MOV AX, @DATA
        
        MOV DS, AX
        MOV ES, AX
        
        LEA SI, STRING1
        LEA DI, STRING2
        
        CLD
        
        MOV CL,4
        REP MOVSB
        MAIN ENDP
    END MAIN