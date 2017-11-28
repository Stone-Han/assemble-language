DATA SEGMENT
BUFFER DB 81,?,81 DUP(?)
MESS   DB 0AH,0DH,"Input a string please:$"
X      DW ?
Y      DW ?
HUICHE DB 0AH,0DH,'$'
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START:
	MOV AX,DATA
	MOV DS,AX
	LEA DX,MESS
	MOV AH,09H
	INT 21H
	MOV AH,0AH
	LEA DX,BUFFER
	INT 21H
	LEA DX,HUICHE
	MOV AH,9
	INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;设置指针22
	LEA BX,BUFFER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV BX,0
	MOV CL,BUFFER+1
	MOV CH,0
	ADD BX,CX
	INC BX
	LEA SI,BUFFER+2;第一个数字
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;逆序
NIXU:	
	
	MOV AL,[SI]
	MOV DL,[BX]
	MOV [SI],DL
	MOV [BX],AL;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;要用AL,DL不能用AX,DX
	INC SI
	DEC BX
	CMP SI,BX;;;;;;;
	JGE PUT
	loop NIXU;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PUT:	LEA BX,BUFFER
	MOV CL,BUFFER+1
	MOV CH,0
	ADD BX,CX
	INC BX
 	MOV BUFFER[BX+1],'$';;;;;;;;;;;;;
	LEA DX,HUICHE
	MOV AH,9
	INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LEA DX,BUFFER+2
	MOV AH,09H
	INT 21H
	MOV AX,4C00H
	INT 21H
CODE ENDS
	END START

	 

	
	
	
