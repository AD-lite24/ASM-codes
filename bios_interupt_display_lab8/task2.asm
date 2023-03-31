.model tiny

.data 
cnt db 5   ;print 5 sequences

.code 
.startup

        mov ah, 00h
        mov al, 03h 
        int 10h

        mov ch, 0
        mov cl, cnt
        mov si, 01h
        mov di, 01h

        mov dh, 0

    
    WRITE1:
        push cx

        mov ah, 02h     ;set cursor position
        mov dl, 0
        mov bh, 0
        int 10h

        ;writing character

        mov ax, si         
        add al, 40h     ;ascii offset
        mov ah, 09h
        mov bh, 0
        mov bl, 00000111b   ;custom spacing
        mov cx, si          
        int 10h
        pop cx

        mov bp, di      ;store old di in bp
        add di, si
        mov si, bp      ;add old di back to si

        inc dh          ;increment row
        dec cx
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