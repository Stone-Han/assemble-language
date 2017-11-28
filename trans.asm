data segment
x db 01111011b
c10 db 10
data ends
code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	mov cx,3
	MOV AL,X
    ONE:MOV AH,0
	DIV C10
	PUSH AX
	LOOP ONE
	MOV CX,3
    TWO:POP DX
	XCHG DH,DL
	OR DL,30H
	MOV AH,2
	INT 21H
	LOOP TWO
	MOV AX,4C00H
	INT 21H
CODE ENDS
END START