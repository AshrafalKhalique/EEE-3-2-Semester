.MODEL SMALL 
.STACK 100
 .DATA 
 STRING1 DB 'HLLO' 
 .CODE 
 MOV AX,@DATA 
 MOV ES,AX 
 MOV DS,AX 
 LEA SI,STRING1+3
 LEA DI,STRING1+4
  STD 
  MOV CL,3 
  REP MOVSB 
  MOV AL,'E' 
   
STOSB 