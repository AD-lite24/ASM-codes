.model tiny
.data
checker db 'a'
str1 db 'The character entered is a$'
str2 db 'not a$'


.code
.startup

    mov ah, 08h
    int 21h

    clc
    cmp al, checker
    je found
    jne notFound

found:
    lea dx, str1
    mov ah, 09h
    int 21h
    jmp done

notFound:
    lea dx, str2
    mov ah, 09h
    int 21h
    jmp done

done:


.exit
end