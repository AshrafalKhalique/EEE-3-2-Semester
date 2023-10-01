.MODEL SMALL
.STACK 100H
.DATA
.CODE
    MAIN PROC
     MOV CX,6
     MOV SI,0010H
    
     ASHRAF:
     MOV AH,1
     INT 21H
     MOV [SI],AL
     INC SI
     LOOP ASHRAF
         
     MOV AH,2
     MOV DL,0AH
     INT 21H
 
     MOV AH,2
     MOV DL,0DH
     INT 21H
             
     MOV CX,6

     MOV SI,0010H
    
     MIM:
     MOV AH,2
     MOV DL,[SI]
     INC SI
     INT 21H
     LOOP MIM   
     
     
   MAIN ENDP
   END MAIN