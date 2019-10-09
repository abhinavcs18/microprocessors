.model small
disp macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
msg1 db 0dh,0ah,"enter file name:$"
msg2 db 0dh,0ah,"file created successfully$"
msg3 db 0dh,0ah,"creation failed$"
msg4 db 0dh,0ah,"Enter the filename to delete$"
msg5 db 0dh,0ah,"deleted successfully$"
msg6 db 0dh,0ah,"deletion failed$"
fname db 40h dup(?)
fname2 db 40h dup(?)
.code
start: mov ax,@data
       mov ds,ax
       disp msg1
       mov si,offset fname

back:  mov ah,01h
       int 21h
       cmp al,0dh
       je next
       mov [si],al
       inc si
       jmp back

next:  mov[si],byte ptr '$'
       lea dx,fname
       mov cx,00h
       mov ah,3ch
       int 21h
       jc failed
       disp msg2
       jmp next1

failed: disp msg3

next1: disp msg4
       mov si,offset fname2

back1: mov ah,01h
       int 21h
       cmp al,0dh
       je next2
       mov [si],al
       inc si
       jmp back1
next2: mov [si],byte ptr '$'
       lea dx,fname2
       mov ah,41h
       int 21h
       jc dfail
       disp msg5
       jmp final

dfail: disp msg6

final: mov ah,4ch
       int 21h
       end start
