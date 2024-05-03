[org 0x7c00] 
mov [diskNum], dl                 

; setting up the stack

xor ax, ax                          
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp

mov bx, 0x7e00

; reading the disk

mov ah, 2
mov al, 1
mov ch, 0
mov dh, 0
mov cl, 2
mov dl, [diskNum]
int 0x13

jnc setmsgcf

temp:
mov ah, 0x0e
mov al, 0

cmp al,[0x7e00]
jne setmsgal
int 0x10
jmp exit



diskNum: 
    db 0
CharErr:
    db "err : ",0
CfChar:
    db "carry flag ",0

sectorChar:
    db "wrong sector number ",0


setmsgcf:
    call PrntErr
    mov bx,CfChar
    mov cx,11
    mov ah,0x0e
    call PrntMsg
    jmp temp

setmsgal:
    call Newline
    call PrntErr
    mov bx,sectorChar
    mov cx,20
    mov ah,0x0e
    call PrntMsg
    jmp exit


Newline:
    mov ah, 0x0e
    mov al, 0x0A
    int 0x10
    ret

PrntErr:
    mov bx,CharErr
    mov cx,6
    mov ah,0x0e
    call PrntMsg
    ret

PrntMsg:
    mov ah,0x0e
    mov al,[bx]
    int 0x10
    inc bx
    dec cx
    cmp cx,0
    jg PrntMsg
    ret

exit:
    jmp $
times 510-($-$$) db 0              
dw 0xaa55
times 512 db 'A'