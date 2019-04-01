.model tiny
.data
att     db      04h
strow   dw      80
stcol   dw      70
enr     dw      180
enc     dw      150
orgn    db      ?
.code
.startup
        mov     ah,0fh
        int     10h
        mov     orgn,al
        mov     al,12h
        mov     ah,00
        int     10h
        mov     dx,strow
x2:     mov     cx,stcol
x1:     mov     al,att
        mov     ah,0ch
        int     10h
        inc     cx
        cmp     cx,enc
        jnz     x1
        inc     dx
        cmp     dx,enr
        jnz     x2
        mov     ah,07h
        int     21h
        cmp     al,'e'
        jnz     x3
x3:     mov     al,orgn
        mov     ah,0
        int     10h

.exit
end
