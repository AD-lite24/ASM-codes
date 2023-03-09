;Write your first name to “name.txt”, and your ID to “id.txt” by
;taking inputs from the terminal prompt

.model tiny
.data

fname1 db 'name.txt', 0
fname2 db 'id.txt', 0
handle1 dw ?
handle2 dw ?


str1 db 'Enter first name: ', 13, 10, '$'
str2 db 'Enter id: ', 13, 10, '$'               ;13 is carriage return for new line, 10 is linefeed

max1 db 32
len1 db ?
msg1 db 32 dup('$')

max2 db 32
len2 db ?
msg2 db 32 dup('$')

.code
.startup

        lea dx, str1
        mov ah, 09h
        int 21h             ;display string (name)

        lea dx, max1
        mov ah, 0ah
        int 21h             ;read user input string (name), stored at msg1

        mov ah, 3ch
        lea dx, fname1
        mov cl, 1h
        int 21h
        mov handle1, ax      ;create new file with name 'name.txt'

        mov ah, 40h 
        mov bx, handle1
        mov cx, 31
        lea dx, msg1
        int 21h             ;write to the file

        mov ah, 3eh
        int 21h             ;close file

        lea dx, str2
        mov ah, 09h
        int 21h             ;display string (id)

        lea dx, max2
        mov ah, 0ah
        int 21h             ;read user input string (name), stored at msg2

        mov ah, 3ch
        lea dx, fname2
        mov cl, 1h
        int 21h
        mov handle2, ax      ;create new file with name 'name.txt'

        mov ah, 40h 
        mov bx, handle2
        mov cx, 31
        lea dx, msg2
        int 21h             ;write to the file

        mov ah, 3eh
        int 21h             ;close file



.exit
end








