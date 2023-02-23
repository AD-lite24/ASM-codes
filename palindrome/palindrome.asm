.model tiny
.data
dat1 db 'wasitcatisaw'
dat1length db 0ch
dat2 db 12 dup(?)
res dw 00h
.code
.startup

        lea si, dat1
        mov cl, dat1length

    X1: 
        inc si
        dec cl      ;moving the si to the end of the string
        jnz X1      ;can also be achieved by just adding the length to si
    
    X2: 
        dec si
        lea di, dat2
        mov al, 0
        mov cl, dat1length
        mov ch, 0           ;ch is cleared to avoid any problems with the count
    
    TransferLoop:           ;creating the reverse string
        std 
        lodsb
        ; mov al, [si]      ;alternative without using string operations
        ; dec si
        cld
        stosb
        loop TransferLoop
        lea si, dat1
        lea di, dat2

    CheckPal:
        mov cl, dat1length
        mov ch, 0           
        repe cmpsb
        jz YesItIs
        jnz NoItIsnt

    YesItIs:
        mov al, 01h
        lea di, res
        stosb
        jmp Over

    NoItIsnt:
        mov al, 00h
        lea di, res
        stosb
        jmp Over
    
    Over:
        lea dx, res         ;to get address of res viewing unassembled instrucions, more convenient to have the last
                            ;instruction as this

.exit
end