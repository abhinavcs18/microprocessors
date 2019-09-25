.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
msg1 db 0dh,0ah,"enter string 1$"
msg2 db 0dh,0ah,"enter string 2$"
msg3 db 0dh,0ah,"strings are same$"
msg4 db 0dh,0ah,"strings are different$"
str1 db 10h dup(0)
str2 db 10h dup(0)
len1 dw 0
len2 dw 0
.code
mov ax,@data
mov ds,ax
display msg1
mov si,00h
back1: mov ah,01h
       int 21h
       cmp al,0dh
       je next1
       mov str1[si],al
       inc si
       inc len1
       jmp back1
next1: display msg2
       mov si,00h
next2: mov ah,01h
       int 21h
       cmp al,0dh
       je comp1
       mov str2[si],al
       inc si
       inc len2
       jmp next2
comp1: mov si,00h
       mov cx,len1
       cmp cx,len2
       jne notequal
comp2: mov bl,str1[si]
       cmp bl,str2[si]
       jne notequal
       inc si
       dec cx
       jnz comp2
       display msg3
       jmp last
notequal: display msg4
last: mov ah,4ch
      int 21h
      end
