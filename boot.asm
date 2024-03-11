[org 0x7c00]

mov ah, 0x0e
mov bx, msg

dispchar:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx          ; Move to the next character in the message
    jmp dispchar

end:
    ; Your code here

msg:
    db "Enter a char : ", 0

getchar:
    db 0

mov ah, 0
int 0x16
mov [getchar], al ; store char

;Print a char
mov ah, 0x0e
mov al, [getchar] ; Load the character from getchar
int 0x10

jmp $  ; Infinite loop to halt execution

times 510 - ($ - $$) db 0
dw 0xaa55
