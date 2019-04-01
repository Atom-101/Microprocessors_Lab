.model  tiny
.data
dat1    db      20h
prev	db		00h
.code
.startup
        mov     ah,00h
        mov     al,03h
        int     10h
        mov     ah,02h
        mov     bh,0
        mov     dx,0
        int     10h
        mov     al,dat1
        mov     ah,09h
        mov     bh,0
        mov     cx,13*80
        mov     bl,1eh
        int     10h
        mov     ah,02h
        mov     bh,0
        mov     dl,0
        mov     dh,13
        int     10h
        mov     ah,09h
        mov     al,dat1
        mov     bh,0
        mov     cx,13*80
        mov     bl,7ah
        int     10h
        mov     ah,02h
        mov     dx,0
        mov     bh,0
        int     10h
x1:     mov		ah,07h
        int		21h
        cmp		al,'#'
        jnz		x2
        cmp		prev,'$'
        jz		x4
x2:		mov		prev,al
		mov		bl,1eh
		mov		bh,0
		mov		cx,01
		mov		ah,09h
		int		10h
		mov		ah,02h
		add		dh,13
		int		10h
		mov		ah,09h
		mov		bl,7ah
		mov		cx,01
		int		10h
		sub		dh,13
		inc		dl
		cmp		dl,80
		jnz		x3
		mov		dl,00
		inc		dh
		cmp		dh,12
		jnz		x3
		mov		dh,00
x3:		mov		ah,02
		int		10h
		jmp		x1
x4:		mov		ah,00
		mov		al,03
		int		10h		       
.exit
end
