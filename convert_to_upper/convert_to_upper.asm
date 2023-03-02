.model tiny
.data

max1 db 32
Act1 db ?

inp1 db 32 dup(0)

.code
.startup

    lea dx, max1
    mov ah, 0ah
    int 21h

    mov al, 20h
    lea di, inp1
    mov cl, Act1
    mov ch, 0

X1: sub [di], al
    inc di
    loop X1

    mov al, '$'
    mov [di], al

    lea dx, inp1
    mov ah, 09h
    int 21h

.exit
end