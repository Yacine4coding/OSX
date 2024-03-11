[org 0x7c00]
mov ah, 0x0e
mov bx, msg

dispchar:
    mov al, [bx]
    cmp al, 0
    je getStr
    int 0x10
    inc bx
    jmp dispchar

getStr:
    mov bx, defStr
    mov ah, 0
    int 0x16
    mov [bx], al
    cmp al, 13
    je endGet
    mov ah, 0x0e
    int 0x10
    inc bx
    jmp getStr

endGet:
    jmp $

msg:
    db "Enter a char : ", 0

defStr:
    times 13 db 0


times 510-($-$$) db 0
dw 0xaa55