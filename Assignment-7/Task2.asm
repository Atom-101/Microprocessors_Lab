.model tiny
.data
	start_row	dw	80
	start_col	dw	70
	end_row 	dw	180
	end_col		dw	150
	color		db	04h
	orig_vid_mode	db	?
.code
.startup
	; get original video mode
	mov		ah, 0fh 
	int 	10h
	mov		orig_vid_mode, al
	
	; set the required video mode
	mov		ah, 00h
	mov		al, 12h
	int 	10h
	
	mov		dx, start_row	; coloring the rectangle

x1:	mov		cx, start_col
x2:	mov		al, color
	mov		ah, 0ch
	int		10h
	

	inc 	cx
	cmp		cx, end_col
	jnz 	x2
	inc		dx
	cmp		dx, end_row
	jnz		x1
	

	mov		ah, 07h
x3:	int		21h
	cmp		al, 'q'
	jnz		x3
	

	mov		al, orig_vid_mode
	mov		ah, 00h
	int		10h
	

.exit
End
