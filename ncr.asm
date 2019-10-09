.model small
.data
n dw 4
r dw 2
ncr dw 0
.code
mov ax,@data
mov ds,ax
mov ax,n
mov bx,r
call ncrr
mov dx,ncr
mov ah,02h
int 21h

ncrr proc near
cmp ax,bx
je res1
cmp bx,0
je res1
cmp bx,1
je resn
dec ax
cmp bx,ax
je incr
push ax
push bx
call ncrr
pop bx
pop ax
dec bx
push ax
push bx
call ncrr
pop bx
pop ax
ret

res1:   inc ncr
        ret

incr:   inc ncr

resn:   add ncr,ax
        ret
      ncrr  endp
         end


