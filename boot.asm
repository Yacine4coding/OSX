[org 0x7c00]

mov bx, buffer

mov cx,13

loop:
    mov ah, 0
    int 0x16
    mov [bx], al

    mov ah, 0x0e
    mov al, [bx]
    int 0x10
    inc bx

    loop loop

exit:
    mov ah, 0x0e
    mov al, 124
    int 0x10

buffer:
    times 13 db 0

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
