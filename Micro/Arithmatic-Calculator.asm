.MODEL SMALL                    ; DEFINING MEMORY REQUIREMENT
.STACK 100                      ; CREATING 100 LOCATION IN STACK SEGMENT
.DATA                           ; DECLARING DATA IN THE  PROGRAM 

STRING1  DB              ' TAKE ANY TWO DIGITS : $'     
STRING2  DB 0AH,0AH,0DH, '   PRESS 1 FOR ADDITION $'
STRING3  DB 0AH,0DH,     '   PRESS 2 FOR SUBTRACTION $'
STRING4  DB 0AH,0DH,     '   PRESS 3 FOR MULTIPLICATION $'
STRING5  DB 0AH,0DH,     '   PRESS 4 FOR DIVISION $'
STRING6  DB 0AH,0AH,0DH, ' TO SELECT ARITHMATIC OPERATION BETWEEN TWO DIGITS, PRESS : $'
STRING7  DB 0AH,0AH,0DH, ' RESULT OF ADDITION: $'
STRING8  DB 0AH,0AH,0DH, ' RESULT OF SUBTRACTION: $'
STRING9  DB 0AH,0AH,0DH, ' RESULT OF MULTIPLICATION: $'
STRING10 DB 0AH,0AH,0AH,0DH, ' RESULT OF DIVISION: $'   
STRING11 DB 0AH,0AH,0DH, '         QUOTIENT   :      $'
STRING12 DB 0AH,0AH,0DH, '         REMAINDER  :      $'
STRING   DB              ' AND $'    
STRNG1   DB              ' + $'
STRNG2   DB              ' - $'
STRNG3   DB              ' * $'
STRNG4   DB              ' / $' 
STRNG5   DB              ' ( $' 
STRNG6   DB              ' ) = $'

.CODE                          ; STARTING CODE  SEGMENT 

MAIN PROC                      ; MAIN PROCEDURE STARTS
    
    MOV AX,@DATA               ; TRANSFER DATA SEGMENT NUMBER TO AX REGISTER
    MOV DS,AX                  ; MOVE VALUE OF AX TO DATA SEGMENT (DS)      
    
    MOV AH,9                   ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT 
    LEA DX,STRING1             ; LOAD EFFECTIVE ADDRESS OF STRING1 IN DX
    INT 21H                    ; PRINTING STRING1

    MOV AH,1                   ; FUNCTION-1 CALLING FOR TAKING INPUT
    INT 21H                    ; INPUT 1ST DIGIT  
    
    MOV BL,AL                  ; MOVE INPUT ASCII VALUE TO BL
        
    MOV AH,9                   ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
    LEA DX,STRING              ; LOAD EFFECTIVE ADDRESS OF STRING IN DX
    INT 21H                    ; PRINTING STRING
    
    MOV AH,1                   ; FUNCTION-1 CALLING FOR TAKING INPUT
    INT 21H                    ; INPUT 2ND DIGIT 
    
    MOV BH,AL                  ; MOVE INPUT ASCII VALUE TO BH 
   
    MOV AH,9                   ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
    LEA DX,STRING2             ; LOAD EFFECTIVE ADDRESS OF STRING2 IN DX
    INT 21H                    ; PRINTING STRING2   
    
    LEA DX,STRING3             ; LOAD EFFECTIVE ADDRESS OF STRING3 IN DX
    INT 21H                    ; PRINTING STRING3
      
    LEA DX,STRING4             ; LOAD EFFECTIVE ADDRESS OF STRING4 IN DX
    INT 21H                    ; PRINTING STRING4
        
    LEA DX,STRING5             ; LOAD EFFECTIVE ADDRESS OF STRING5 IN DX
    INT 21H                    ; PRINTING STRING5
        
    LEA DX,STRING6             ; LOAD EFFECTIVE ADDRESS OF STRING6 IN DX
    INT 21H                    ; PRINTING STRING6

    MOV AH,1                   ; FUNCTION-1 CALLING FOR TAKING INPUT
    INT 21H                    ; TAKING INPUT
    
    CMP AL,31H                 ; COMPARE THE VALUE OF AL WITH 31H
    JE LABEL1                  ; JUMP TO LABEL1 IF AL EQUALS TO 31H
    
    CMP AL,32H                 ; COMPARE THE VALUE OF AL WITH 32H
    JE LABEL2                  ; JUMP TO LABEL2 IF AL EQUALS TO 32H
    
    CMP AL,33H                 ; COMPARE THE VALUE OF AL WITH 33H
    JE LABEL3                  ; JUMP TO LABEL3 IF AL EQUALS TO 33H
    
    CMP AL,34H                 ; COMPARE THE VALUE OF AL WITH 34H
    JE LABEL4                  ; JUMP TO LABEL4 IF AL EQUALS TO 34H
    
    LABEL1:                    ; LABEL1 TAG
         CALL  ADDITION        ; CALLING ADDITION SUB-PROCEDURE
         JMP EXIT              ; JUMP TO EXIT TAG
    
    LABEL2:                    ; LABEL2 TAG
         CALL  SUBTRACTION     ; CALLING SUBTRACTION SUB-PROCEDURE
         JMP EXIT              ; JUMP TO EXIT TAG
    
    LABEL3:                    ; LABEL3 TAG
         CALL  MULTIPLICATION  ; CALLING MULTIPLICATION SUB-PROCEDURE
         JMP EXIT              ; JUMP TO EXIT TAG
         
    LABEL4:                    ; LABEL4 TAG
         CALL  DIVISION        ; CALLING DIVISION SUB-PROCEDURE
         JMP EXIT              ; JUMP TO EXIT TAG
         
    EXIT:                      ; EXIT TAG
    
    MOV AX,4CH                 ; MOVE THE VALUE 4CH TO AX REGISTER
    INT 21H                    ; TERMINATE PROGRAM IMMEDIATELY
    
    MAIN ENDP                  ; MAIN PROCEDURE ENDS
    
    ADDITION PROC              ; ADDITION SUB-PROCEDURE STARTS
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRING7         ; LOAD EFFECTIVE ADDRESS OF STRING7 IN DX
        INT 21H                ; PRINTING STRING7 
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG5          ; LOAD EFFECTIVE ADDRESS OF STRNG5 IN DX
        INT 21H                ; PRINTING STRNG5      
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT  
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG1          ; LOAD EFFECTIVE ADDRESS OF STRING1 IN DX
        INT 21H                ; PRINTING STRNG1 
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BH              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT 
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG6          ; LOAD EFFECTIVE ADDRESS OF STRING6 IN DX
        INT 21H                ; PRINTING STRNG6  
        
        SUB BL,30H             ; SUBTRACT 30H FROM BL AND RESULT STORED IN BL
        SUB BH,30H             ; SUBTRACT 30H FROM BH AND RESULT STORED IN BH
        ADD BL,BH              ; ADD BL WITH BH AND RESULT STORED IN BL
        MOV AL,BL              ; MOVE THE VALUE OF BL IN AL
        MOV AH,0H              ; MOVE THE VALUE 0H IN AL
        MOV BL,0AH             ; MOVE THE VALUE 0AH IN AL
        DIV BL                 ; DIVIDE AX BY BL AND QUOTIENT STORED IN AL AND REMAINDER STORED IN AH  
        
        MOV BH,AH              ; MOVE THE VALUE OF BH IN AH
        ADD BH,30H             ; ADD BH WITH THE VALUE 30H AND RESULT STORED IN BH
        MOV BL,AL              ; MOVE THE VALUE OF BL IN AL
        ADD BL,30H             ; ADD BL WITH THE VALUE 30H AND RESULT STORED IN BL
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT      
        
        MOV DL,BH              ; MOVE THE VALUE OF BL TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT
    
        RET                    ; RETURN TO MAIN PROCEDURE
                               
     ADDITION ENDP             ; ADDITION SUB-PROCEDURE ENDS 
                                                              
                                                              
     SUBTRACTION PROC          ; SUBTRACTION SUB-PROCEDURE STARTS
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRING8         ; LOAD EFFECTIVE ADDRESS OF STRING8 IN DX
        INT 21H                ; PRINTING STRING8 
                           
        LEA DX,STRNG5          ; LOAD EFFECTIVE ADDRESS OF STRNG5 IN DX
        INT 21H                ; PRINTING STRNG5      
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT  
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG2          ; LOAD EFFECTIVE ADDRESS OF STRNG2 IN DX
        INT 21H                ; PRINTING STRNG2 
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BH              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT 
        
        SUB BL,30H             ; SUBTRACT 30H FROM BL AND RESULT STORED IN BL
        SUB BH,30H             ; SUBTRACT 30H FROM BH AND RESULT STORED IN BH       
        
        CMP BL,BH              ; COMPARE BH WITH BL
        JAE TOP                ; JUMP TO TOP TAG IF BL IS ABOVE OR EQUAL 
            SUB BH,BL          ; SUBTRACT BL FROM BH AND RESULT STORED IN BH
            MOV CL,BH          ; MOVE THE VALUE OF BH TO CL REGISTER
            
            MOV AH,9           ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
            LEA DX,STRNG6      ; LOAD EFFECTIVE ADDRESS OF STRNG6 IN DX
            INT 21H            ; PRINTING STRNG6  
        
            ADD CL,30H         ; ADD BL WITH THE VALUE 30H AND RESULT STORED IN BL
            
            MOV AH,9           ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
            LEA DX,STRNG2      ; LOAD EFFECTIVE ADDRESS OF STRNG2 IN DX
            INT 21H            ; PRINTING STRNG2 
            
            MOV AH,2           ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
            MOV DL,CL          ; MOVE THE VALUE OF CL TO DL REGISTER
            INT 21H            ; PRINTING ADDITION RESULT
            
            JMP FINISH         ; JUMP TO FINISH TAG
        
        TOP:                   ; TOP TAG
            SUB BL,BH          ; SUBTRACT BL FROM BH AND RESULT STORED IN BH
            MOV CL,BL          ; MOVE THE VALUE OF BL TO CL REGISTER
                
            MOV AH,9           ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
            LEA DX,STRNG6      ; LOAD EFFECTIVE ADDRESS OF STRNG6 IN DX
            INT 21H            ; PRINTING STRNG6  
        
            ADD CL,30H         ; ADD BL WITH THE VALUE 30H AND RESULT STORED IN BL
        
            MOV AH,2           ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
            MOV DL,CL          ; MOVE THE VALUE OF BH TO DL REGISTER
            INT 21H            ; PRINTING ADDITION RESULT    
        
        FINISH:                ; FINISH TAG
    
        RET                    ; RETURN TO MAIN PROCEDURE
                                
     SUBTRACTION ENDP          ; SUBTRACTION SUB-PROCEDURE ENDS    
          
          
     MULTIPLICATION PROC       ; MULTIPLICATION SUB-PROCEDURE STARTS
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRING9         ; LOAD EFFECTIVE ADDRESS OF STRING9 IN DX
        INT 21H                ; PRINTING STRING9 
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG5          ; LOAD EFFECTIVE ADDRESS OF STRNG5 IN DX
        INT 21H                ; PRINTING STRNG5      
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT  
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG3          ; LOAD EFFECTIVE ADDRESS OF STRNG3 IN DX
        INT 21H                ; PRINTING STRNG3 
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BH              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT 
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG6          ; LOAD EFFECTIVE ADDRESS OF STRING7 IN DX
        INT 21H                ; PRINTING STRNG5  
        
        SUB BL,30H             ; SUBTRACT 30H FROM BL AND RESULT STORED IN BL
        SUB BH,30H             ; SUBTRACT 30H FROM BH AND RESULT STORED IN BH
        MOV AL,BL              ; MOVE THE VALUE OF BL IN AL
        MOV BL,BH              ; ADD BL WITH BH AND RESULT STORED IN BL
        MUL BL                 ; MULTIPLY AX BY BL
        
        MOV AH,0H              ; MOVE THE VALUE 0H IN AL
        MOV BL,0AH             ; MOVE THE VALUE 0AH IN AL
        DIV BL                 ; DIVIDE AX BY BL AND QUOTIENT STORED IN AL AND REMAINDER STORED IN AH 
        
        MOV BH,AH              ; MOVE THE VALUE OF BH IN AH
        ADD BH,30H             ; ADD BH WITH THE VALUE 30H AND RESULT STORED IN BH
        MOV BL,AL              ; MOVE THE VALUE OF BL IN AL
        ADD BL,30H             ; ADD BL WITH THE VALUE 30H AND RESULT STORED IN BL
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT      
        
        MOV DL,BH              ; MOVE THE VALUE OF BL TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT
    
        RET                    ; RETURN TO MAIN PROCEDURE
                               
     MULTIPLICATION ENDP       ; MULTIPLICATION SUB-PROCEDURE ENDS 
                       
                       
     DIVISION PROC             ; DIVISION SUB-PROCEDURE STARTS
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRING10        ; LOAD EFFECTIVE ADDRESS OF STRING10 IN DX
        INT 21H                ; PRINTING STRING10 
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG5          ; LOAD EFFECTIVE ADDRESS OF STRNG5 IN DX
        INT 21H                ; PRINTING STRNG5      
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT  
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRNG4          ; LOAD EFFECTIVE ADDRESS OF STRNG4 IN DX
        INT 21H                ; PRINTING STRNG4 
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BH              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING ADDITION RESULT 
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,' '             ; MOVE THE ASCII VALUE OF THE CHARACTER TO DL REGISTER
        INT 21H                ; PRINTING CHARACTER
        MOV DL,')'             ; MOVE THE ASCII VALUE OF THE CHARACTER TO DL REGISTER
        INT 21H                ; PRINTING CHARACTER  
        
        SUB BL,30H             ; SUBTRACT 30H FROM BL AND RESULT STORED IN BL
        SUB BH,30H             ; SUBTRACT 30H FROM BH AND RESULT STORED IN BH
        MOV AL,BL              ; MOVE THE VALUE OF BL IN AL
        MOV BL,BH              ; MOVE THE VALUE OF BH IN BL
        
        MOV AH,0H              ; MOVE THE VALUE 0H IN AL
        DIV BL                 ; DIVIDE AX BY BL AND QUOTIENT STORED IN AL AND REMAINDER STORED IN AH 
        
        MOV BH,AH              ; MOVE THE VALUE OF BH IN AH
        ADD BH,30H             ; ADD BH WITH THE VALUE 30H AND RESULT STORED IN BH
        MOV BL,AL              ; MOVE THE VALUE OF BL IN AL
        ADD BL,30H             ; ADD BL WITH THE VALUE 30H AND RESULT STORED IN BL
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRING11        ; LOAD EFFECTIVE ADDRESS OF STRING11 IN DX
        INT 21H                ; PRINTING STRNG11  
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BL              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING OUTPUT     
        
        MOV AH,9               ; FUNCTION-9 CALLING FOR MULTIPLE OUTPUT
        LEA DX,STRING12        ; LOAD EFFECTIVE ADDRESS OF STRING12 IN DX
        INT 21H                ; PRINTING STRING12  
        
        MOV AH,2               ; FUNCTION-2 CALLING FOR SINGLE OUTPUT
        MOV DL,BH              ; MOVE THE VALUE OF BH TO DL REGISTER
        INT 21H                ; PRINTING OUTPUT
    
        RET                    ; RETURN TO MAIN PROCEDURE
                               
     DIVISION ENDP             ; DIVISION SUB-PROCEDURE ENDS     
         
END MAIN                       ; PROGRAM END