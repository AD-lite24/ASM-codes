;NOTE: This is exact same code as task1.asm

;******************************************


.model tiny
.data

; Data section contains the messages, the correct username, and password for comparison.

usn1 db "anub@g.com$" ; Correct username for comparison
max1 db 20 ; Maximum length for input
act1 db ? ; Placeholder for action
inp1 db 20 dup("$") ; Buffer to store file input for username
fname_user db 'user.txt', 0
fname_pwd db 'pwd.txt', 0
handle_user dw ?
handle_pwd dw ?

pass1 db "oscar" ; Correct password for comparison
max2 db 30
inp2 db 30 dup("$") ; Buffer to store file's input for password
msg3 db "hello $" ; Message 3: Greeting message when both inputs are correct
msg4 db "wrong username$" ; Message 4: Wrong username input
msg5 db "wrong password$" ; Message 5: Wrong password input
nline db 0ah, 0dh, "$" ; New line characters

.code
.startup

        mov ah, 3dh         ;open user.txt file
        mov al, 0h
        lea dx, fname_user
        int 21h
        mov handle_user, ax

        mov ah, 3fh
        mov bx, handle_user
        mov cl, max1
        mov ch, 0
        lea dx, inp1
        int 21h             ;read content from the file

        mov ah, 3eh
        int 21h             ;close file

        cld
        lea di, inp1
        lea si, usn1
        mov cx, 11
        repe cmpsb
        jcxz l1

        ;if username is incorect
        
        lea dx, msg4
        mov ah, 09h
        int 21h

        mov ah, 4ch
        int 21h

        ;else
    
    l1: 
        lea dx, nline
        mov ah, 09h
        int 21h


        mov ah, 3dh         ;open pwd.txt file
        mov al, 0h
        lea dx, fname_pwd
        int 21h
        mov handle_pwd, ax

        mov ah, 3fh
        mov bx, handle_pwd
        mov cl, max2
        mov ch, 0
        lea dx, inp2
        int 21h             ;read content from the file

        mov ah, 3eh
        int 21h             ;close file

        mov cx, 6
        lea di, inp2
        lea si, pass1
        repe cmpsb
        jcxz l2

        ;if pwd is incorrect

        lea dx, msg5
        mov ah, 09h
        int 21h

        mov ah, 4ch
        int 21h

        ;else
    l2:
        lea dx, msg3
        mov ah, 09h
        int 21h

        lea dx, usn1
        mov ah, 09h
        int 21h 


.exit
end