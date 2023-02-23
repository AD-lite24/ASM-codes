.model tiny
.data
string1 db 'BITSIOTLAB'
string2 db 'IOT'
string1length db 0ah
string2length db 03h
temp db 0ah dup(?)

.code
.startup

        ;GOAL: Replace substring 'IOT' with '*'
        mov ch, 0
        mov dh, string1length
        sub dh, 02h

        lea si, string1
        lea di, string2    
        cld


    Iter1:  
        mov cl, string2length
        dec dh
        jnz Iter2
        jz Over

    Iter2:
        mov bx, si
        repe cmpsb
        jnz PostIter2 ;checks if cx became zero 
        jz Found
    
    PostIter2:
        inc bx  ; move pointer to the next iteration for Iter1
        mov si, bx  ; bx keeps track of the pointer to the previous iteration
        lea di, string2 ; di is pointer 2 the substring to replace
        jmp Iter1
    
    Found:
        mov di, bx
        mov ah, '*'

        mov [di], ah

        lea bx, string1
        mov al, string1length
        mov ah, 0h
        add bx, ax
        sub bx, si


        mov cl, bl ;calculated number of chars to shift
        inc di
        mov si, di
        add si, 02h

        rep movsb ;shift it back
        jmp Over

    
    Over:
        
.exit
end