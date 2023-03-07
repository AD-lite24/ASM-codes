.model tiny
.data

arr db 02h, 15h, 04h, 13h, 11h, 9h, 10h
len db 07h ;array length
key db ?

.code
.startup

        mov cl, len
        mov ch, 0
        lea si, arr + 1    ;load the next element in si
        lea di, arr

    LOOP1:
        mov ah, [si]     ;store key from si
        mov key, ah      ;key memory location kinda unneccesary in hindsight
        jmp LOOP2

    POSTPROC:
        inc si
        mov bx, si
        dec bx          ;some work to move the previous location of si
        mov di, bx
        dec cx
        jnz LOOP1
        jmp DONE

    LOOP2:
        mov ah, key
        cmp [di], ah
        jl REPLACE     
        call SHIFTOP

        dec di
        mov bx, [di]
        cmp bx, offset arr ;check if di has gone behind 0th index
        jl REPLACE
        jmp LOOP2

    REPLACE:
        mov al, key
        inc di
        mov [di], al
        jmp POSTPROC

    DONE:



.exit

SHIFTOP proc near
      mov dl, [di]
      mov [di] + 1, dl
      ret
SHIFTOP endp

end