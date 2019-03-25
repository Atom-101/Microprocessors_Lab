.model tiny
.data
    text db 'DOLL'
.code
.startup
    lea si,text
    
    ;Set disp
    xor ah,ah
    mov al,03h
    int 10h

    ;Set cursor position
    mov ah,02h
    mov dh,12
    mov dl,39
    xor bh,bh
    int 10h

    ;Set attribute
    mov bl, 8fh

    ;write D
    mov ah, 09h
    mov al,[si]
    xor bh,bh
    mov cx,01h
    int 10h

    ;Move cursor
    inc si
    mov ah,02h
    mov dh,12
    mov dl,40
    xor bh,bh
    int 10h

    ;Write O
    mov ah, 09h
    mov al,[si]
    xor bh,bh
    mov cx,01h
    int 10h

    ;Move cursor
    inc si
    mov ah,02h
    mov dh,12
    mov dl,41
    xor bh,bh
    int 10h
    
    ;Write LL
    mov ah, 09h
    mov al,[si]
    xor bh,bh
    mov cx,02h
    int 10h

    ;Hold screen
    mov ah,08h
    x1: int 21h
    cmp al,'A'
    jnz x1

.exit
end


