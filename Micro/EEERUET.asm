.MODEL SMALL 
.STACK 100 
.DATA 
STRING2 DB 8 DUP(?) 
STRING1 DB 'EEE_RUET' 
.CODE 
    MAIN PROC NEAR
        MOV AX,@DATA
        MOV DS,AX 
        MOV ES,AX 
        LEA SI,STRING1 
        LEA DI,STRING2 
        CLD 
        MOV CL,8 
        REP 
        MOVSB  
        MAIN ENDP
     END MAIN