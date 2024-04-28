


mov cx,13

loop:
    mov ah,0
    int 0x16
    mov bh,al
    call dispChar

    loop loop

dispChar:
    mov ah,0x0e
    mov al,bh
    int 0x10
    ret 


Dcmp:
    idiv bx,10

    
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
