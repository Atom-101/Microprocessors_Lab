.model tiny
.data
	space 	db	20h
	char	db	00h
.code
.startup
	;setting the video mode
	mov 	ah, 00h 
	mov 	al, 03h
	int		10h
	
	;write spaces with desired background colur to set background
	;spaces can later be overwritten by actual input
	
	;cursor at the begining
x:	mov 	ah, 02h 
	mov 	bh, 00h
	mov 	dx, 00h
	int 	10h
	
	;setting first screen
	mov 	ah, 09h 
	mov		al, space
	mov 	bh, 00h
	mov 	bl, 1eh
	mov		cx, 12*80
	int 	10h
	
	;cursor at next half
	mov 	ah, 02h 
	mov		bh, 00h
	mov		dl, 00h
	mov 	dh, 0ch
	int 	10h
	
	;setting next half
	mov 	ah, 09h 
	mov 	al, space
	mov 	bh, 00h
	mov 	bl, 7ah
	mov		cx, 13*80
	int 	10h
	
	;cursor at the begining
	mov 	ah, 02h 
	mov 	bh, 00h
	mov 	dx, 00h
	int 	10h
	
	;input
x1:	mov		ah, 07h
	int		21h
	cmp		al, '#'
	jnz 	x2
	;char has previous input
	cmp		char, '$'
	jz 		x4
	
	;writing entered char to first half
x2: mov 	ah,09h 
	mov		char, al
	mov		bl, 1eh
	mov 	bh, 00h
	mov 	cx, 01h
	int 	10h

	
	;cursor at next half
	mov 	ah, 02h 
	add		dh , 0ch
	mov 	bh, 00h
	int 	10h
	
	;writing entered char to next half
	mov 	ah, 09h 
	mov 	bh, 00h
	mov 	bl, 7ah
	mov 	cx, 01h
	int 	10h
	
	;resetting cursor and checking boundary conditions
	;move cursor if not full
	sub		dh, 0ch 
	inc 	dl
	cmp		dl, 80
	jnz		x3
	
	;clear screen if full
	mov 	dl, 00h
	inc		dh
	cmp		dh, 0ch
	jz		x

x3:	mov 	ah, 02h
	int 	10h
	jmp		x1

x4:	mov 	ah,00h
	mov 	al, 03h
	int 	10h
	

.exit
end
