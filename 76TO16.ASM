data  segment
      buffer db 6,?,6 dup(?)
      c10    dw 10
      x      dw ?
      c16    dw 16
      hex    db "0123456789ABCDEF"
      STRING DB 0AH,0DH,'$'
data  ends
code  segment
	assume ds:data,cs:code
start:                               ;10
	mov  AX,DATA
	MOV  DS,AX
	lea  DX,BUFFER
	MOV  AH,0AH
	INT  21H
	MOV  AX,0
	MOV  CL,BUFFER+1
	MOV  CH,0
	LEA  BX,BUFFER+2
ONE:                                ;20
	MUL  C10
	MOV  DL,[BX]
	AND  DL,0FH
	ADD  AL,DL
	ADC  AH,0
	INC  BX
	LOOP ONE
	MOV  X,AX

LEA DX,STRING
MOV AH,9
INT 21H
	MOV AX,DATA                      ;30
	MOV DS,AX
	MOV CL,4
	
	MOV AX,X
TWO:
	MOV DX,0
	DIV C16
	PUSH DX
	LOOP TWO
  	MOV CL,4

	LEA BX,HEX
THREE:
	POP AX
	XLAT
	MOV DL,AL
	MOV AH,2
	INT 21H
	LOOP THREE



	

	


	MOV  AX,4C00H
	INT  21H
CODE  ENDS
	END START