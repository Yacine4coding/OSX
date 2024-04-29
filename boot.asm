[org 0x7c00]

;Print msg

mov bx,msg
mov cx,16
mov ah,0x0e
call PrntMsg

;Get String
mov cx,5
mov bx,buffer
call GetChar

;Print string
mov cx,5
mov bx,buffer

call PrntMsg

jmp exit

PrntMsg:
    mov ah,0x0e
    mov al,[bx]
    int 0x10
    inc bx
    dec cx
    cmp cx,0
    jg PrntMsg
    ret

GetChar:
    mov ah,0
    int 0x16
    mov [bx],al
    inc bx
    dec cx
    cmp cx,0
    jg GetChar
    ret

msg:
    db "Enter your Name:",0

buffer:
    times 5 db 0

exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
