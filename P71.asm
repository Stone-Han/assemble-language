data segment
x db 01111011b
c db 100
data ends
code segment
assume ds:data,cs:code
start:
mov ax,data
mov ds,ax
mov cx,3
mov al,x
one:
mov ah,0
div c
push ax
div c
mov c,al
loop one
mov cx,3
two:
pop dx
or dh,30h
mov ah,2
int 21h
loop two
mov ax,4c00h
int 21h
code ends
end start
