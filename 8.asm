DATA SEGMENT
BUFFER DB 81,?,81 DUP(?)
S      DB 81 DUP(?),'$'
MESS   DB 0AH,0DH,"INPUT A STRING:$"
DATA ENDS
CODE SEGMENT
  ASSUME  CS:CODE,DS:DATA
START: MOV AX,DATA
       MOV DS,AX
       LEA DX,MESS
       MOV AH,09H
       INT 21H         ;�����ʾ��Ϣ
       MOV AH,0AH
       LEA DX,BUFFER
       INT 21H         ;�����ַ���
       LEA SI,BUFFER+2     ;1       15 16 17
      ; MOV CX,BUFFER+1
       ;LEA DI,BUFFER+ ;���
       LEA DI,BUFFER
       MOV CL,BUFFER+1 
       MOV CH,0
       ADD DI,CX
       INC DI
      
Q:     CMP SI,DI
     ;  JNE L     ;�����
       JL  L
       JE   M
       JG OUTPUT
M:     MOV AX,[SI]    ;;;;;;;;;;;;;;;;
      MOV S[SI-2],AL
       JMP OUTPUT   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
L:     MOV AX,[SI]
       ; MOV [SI],[DI]      ;27HANG
       MOV BX,[DI]
       ; MOV [DI],AX
       ;MOV [DI],AX
       ;MOV [SI],BX
       MOV S[SI-2],BL
       MOV S[DI-2],AL
       INC SI
       DEC DI
       JMP Q
OUTPUT:
       LEA DX,S
       MOV AH,09H
       INT 21H
       MOV AX,4C00H
       INT 21H
CODE ENDS
     END START       
