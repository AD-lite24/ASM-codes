.model tiny
.data

fname1 db 'name.txt', 0
fname2 db 'id.txt', 0
fname3 db 'splice.txt', 0

handle1 dw ?
handle2 dw ?
handle3 dw ?

part1 db 6 dup('$')
part2 db 13 dup('$')

.code
.startup

        mov ah, 3dh 
        mov al, 0h
        lea dx, fname1
        int 21h
        mov handle1, ax     ;open 'name.txt'

        mov ah, 3fh 
        mov bx, handle1
        mov cx, 6
        lea dx, part1
        int 21h             ;read content from 'name.txt'

        mov ah, 3eh 
        int 21h             ;close file

        mov ah, 3dh 
        mov al, 0h
        lea dx, fname2
        int 21h
        mov handle2, ax     ;open 'id.txt'
        
        mov ah, 3fh 
        mov bx, handle2
        mov cx, 13
        lea dx, part2
        int 21h             ;read content from 'id.txt'

        mov ah, 3eh 
        int 21h             ;close file
        
        mov ah, 3ch
        lea dx, fname3
        mov cl, 1h
        int 21h
        mov handle3, ax      ;create new file with name 'splice.txt'

        mov ah, 40h
        mov bx, handle3
        mov cx, 13
        lea dx, part2
        int 21h             ;write part2(id) to splice.txt

        mov ah, 40h 
        mov bx, handle3
        mov cx, 6
        lea dx, part1
        int 21h             ;write part1(name) to splice.txt

        mov ah, 3eh 
        int 21h  

        

.exit
end

