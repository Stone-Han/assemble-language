DATA SEGMENT
PROMPT  DB  0DH,0AH,"INPUT A HIGHERCASE LETTER:$"
ERR_MSG DB  0DH,0AH,"INPUT ERROR.$"
BUF     DB  0DH,0AH,'Prev:'
PREV    DB  20H
	DB  0DH,0AH,'Succ:'
SUCC    DB  20H
	DB  0DH,0AH,'$'
DATA ENDS
CODE SEGMENT
     ASSUME  CS:CODE,DS:DATA
START:
	MOV AX,DATA
	MOV DS,AX
INPUT:
	LEA DX,PROMPT
	MOV AH,9
	INT 21H
	MOV AH,1
	INT 21H
	CMP AL,'A'
	JB  ERROR
	CMP AL,'Z'
	JA  ERROR
	MOV BL,AL
	DEC BL
	CMP BL,'A'
	JB  SKIP1
	MOV PREV,BL
SKIP1:
	INC AL
	CMP AL,'Z'
	JA  SKIP2
	MOV SUCC,AL
SKIP2:
	LEA DX,BUF
	MOV AH,09H
	INT 21H
	JMP EXIT
ERROR:
	LEA DX,ERR_MSG
	MOV AH,09H
	INT 21H
	JMP INPUT
EXIT:
	MOV AX,4C00H
	INT 21H
CODE  ENDS
	END START