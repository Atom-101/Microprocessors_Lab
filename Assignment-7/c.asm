.model  tiny
.data
dat1    db      "Doll"
cnt     db      04h
.code
.startup
        mov     ah,00h
        mov     al,03h
        int     10h
        lea     si,dat1
        mov     dl,38
x1:     mov     ah,02h
        mov     bh,0
        mov     dh,12
        int     10h
        mov     ah,09h
        lodsb
        mov     bh,0
        mov     cx,01
        mov     bl,8Fh
        int     10h
        inc     dl
        dec     cnt
        jnz     x1
        
.exit
end
