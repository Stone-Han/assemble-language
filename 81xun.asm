data segment
buffer db 6,?,6 dup(?);   ���5������
c10    dw 10
d10    db 10
a      db 0dh,0ah,'$'
num    dw ?           ;����
x	db ?
in_mess db 0dh,0ah,"Input a number:$"
out_mess db 0dh,0ah,"the number of '1'in it:$"
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax

	lea  dx,in_mess
	mov ah,9
	int  21h
;;;;;;;��������
	lea dx,buffer
	mov  ah,0ah
	int 21h
	mov ax,0
	mov cl,buffer+1
	mov ch,0
	lea bx,buffer+2

	one:
	mul c10
	mov dl,[bx]
	and dl,0fh
	add al,dl
	adc ah,0
	inc bx
	loop one
	
;;;;;;;;;;;;
;mov  cx,16
mov  dx,0

s0:
shr  ax,1
adc  dx,0
;;;;;;;;;;;;�ж����µ��Ƿ�Ϊ0
cmp ax,0
jz line;;;;;;;����0 ѭ������

loop s0
line:
mov num,dx
lea dx,out_mess
mov ah,9
int 21h

mov ax,num
;;;;;10�������
mov cx,2
mov ax,num
two:
mov ah,0
div d10
push ax
loop two
mov cx,2
three:
pop dx
xchg dh,dl
or dl,30h
mov ah,2
int 21h
loop three
;;;;;;;;;;;;;;;;;;;;;

;������лس�
;lea dx,a
;mov ah,9
;int 21h
;;;;;;;;;;;;;;;;;;;;;
mov ax,4c00h
int 21h

code ends
end start
