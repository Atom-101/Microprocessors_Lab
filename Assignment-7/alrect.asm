.model tiny
.data
att     db      04h
strow   dw      00
stcol   dw      00
enr     dw      150
enc     dw      250
orgn    db      ?
colv    dw      20
rowv    dw      10
rectc   db      6
.code
.startup
        mov     ah,0fh
        int     10h
        mov     orgn,al
        mov     al,12h
        mov     ah,00
        int     10h
x4:     mov     dx,strow
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
        dec     rectc
        jz      x3
        mov     ax,rowv
        add     strow,ax
        sub     enr,ax
        mov     ax,colv
        add     stcol,ax
        sub     enc,ax
        mov     ah,att
        cmp     ah,04h
        jnz     x5
        mov     al,02h
        jmp     x6
x5:     mov     al,04h
x6:     mov     att,al
        jmp     x4
x3:     mov     ah,07h
        int     21h
        cmp     al,'e'
        jnz     x3
        mov     al,orgn
        mov     ah,0
        int     10h

.exit
end
