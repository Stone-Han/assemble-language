DATA SEGMENT
SUM  DB ?
c10  db 10	
DATA ENDS



CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:
MOV AX,DATA
MOV DS,AX
MOV CX,5
MOV SUM,0
ONE:
MOV AH,1
INT 21H
AND AL,0FH
ADD SUM,AL
LOOP ONE

;sum=of
;start output
mov ax,data
mov ds,ax
mov cx,3
mov al,sum
two:
mov ah,0
div c10
push ax
loop two
mov cx,3
three:
pop dx
xchg dh,dl
or dl,30h
mov ah,2
int 21h
loop three

MOV AX,4C00H
INT 21H
CODE ENDS
END START