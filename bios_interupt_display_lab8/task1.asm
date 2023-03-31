.model tiny

.data 
inp1 db 'AdityaDandwate'
cnt db 14   ;count
colmstr dw ?
rowstr dw ?

.code 
.startup

        mov ah, 00h
        mov al, 00h 
        int 10h

        lea si, inp1
        mov dl, cnt 
        mov dh, 0
        add si, dx
        lea di, cnt
        mov ch, 0
        mov cl, [di]

        mov colmstr, 5
        mov rowstr, 5
    
    WRITE1:
        push cx

        mov ah, 02h     ;set cursor position
        lea di, rowstr
        mov dh, [di]
        lea di, colmstr
        mov dl, [di]
        mov bh, 00h
        int 10h

        mov ah, 09h    ;write charecter
        mov al, [si]
        mov bh, 00
        mov bl, 00001111b
        mov cx, 01
        int 10h
        pop cx

        dec si
        inc word ptr[di]        ;increment column
        lea di, rowstr
        inc word ptr[di]        ;increment row
        dec cl                  ;decrement count
        jnz WRITE1

    END1: 
        mov ah, 07h
        int 21h 
        cmp al, "%"
        jnz END1                ;blocking function

    TERM:   
        mov ah, 4ch
        int 21h

.exit 
end