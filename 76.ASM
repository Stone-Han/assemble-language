data  segment
      buffer db 6,?,6 dup(?)
      c10    dw 10
      x      dw ?
data  ends
code  segment
	assume ds:data,cs:code
start:
	mov  AX,DATA
	MOV  DS,AX
	lea  DX,BUFFER
	MOV  AH,0AH
	INT  21H
	MOV  AX,0
	MOV  CL,BUFFER+1
	MOV  CH,0
	LEA  BX,BUFFER+2
ONE:
	MUL  C10
	MOV  DL,[BX]
	AND  DL,0FH
	ADD  AL,DL
	ADC  AH,0
	INC  BX
	LOOP ONE
	MOV  X,AX
	MOV  AX,4C00H
	INT  21H
CODE  ENDS
	END START