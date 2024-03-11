[org 0x7c00]
mov ah, 0x0e
mov bx , varName

printString:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp printString
end:

jmp $

varName:
    db "Hello World!"
times 510-($-$$) db 0
dw 0xaa55
