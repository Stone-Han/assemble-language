data segment
buffer db 6,?,6 dup(?);   最多5个数字
c10    dw 10
d10    db 10
a      db 0dh,0ah,'$'
num    dw ?           ;个数
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
;;;;;;;输入数字
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
;;;;;;;;;;;;判断余下的是否为0
cmp ax,0
jz line;;;;;;;等于0 循环结束

loop s0
line:
mov num,dx
lea dx,out_mess
mov ah,9
int 21h

mov ax,num
;;;;;10进制输出
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

;输出换行回车
;lea dx,a
;mov ah,9
;int 21h
;;;;;;;;;;;;;;;;;;;;;
mov ax,4c00h
int 21h

code ends
end start
