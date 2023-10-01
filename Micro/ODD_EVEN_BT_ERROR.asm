.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'ENTER NUMBER'
EVEN DB, 13,10,"EVEN$"   
ODD DB, 13,10,"ODD$"
.CODE
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV DS, AX
        LEA DX, MSG
        
        MOV AH,9
        INT 21H 
        MOV AH,1
        INT 21H
        
        MOV BL,2
        DIV BL
        CMP AH,0
        JE EVEN
        
        LEA DX,ODD
        MOV AH,9
        INT 21H
        
        MOV AH,4CH
        INT21H
        
        EVEN:
            LEA DX,EVEN
            MOV AH,9
            INT21H
        LOOP EVEN
        
        MAIN ENDP
    END MAIN
     