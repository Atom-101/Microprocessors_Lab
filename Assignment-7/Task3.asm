.model tiny
.data
	start_row	dw	00h
	start_col	dw	00h
	end_row		dw	250
	end_col		dw	150
	color		db  04h
	orig_vid_mode	db	?
	row_width	dw	23
	col_width	dw	13
	rect_num	db	6
.code
.startup
	

	mov		ah, 0fh ; get original video mode
	int 	10h
	mov		orig_vid_mode, al
	

	mov		ah, 00h ; set the required video mode
	mov		al, 12h
	int 	10h
	

x1:	mov		dx, start_row	; coloring the rectangle
x2:	mov		cx, start_col
x3:	mov		al, color
	mov		ah, 0ch
	int		10h
	

	inc 	cx
	cmp		cx, end_col
	jnz 	x3
	inc		dx
	cmp		dx, end_row
	jnz		x2
	

	dec 	rect_num
	jz		x6
	

	mov		ax, row_width
	add		start_row, ax
	sub		end_row, ax
	mov		ax, col_width
	add		start_col, ax
	sub		end_col, ax
	

	mov		ah, 0ch
	mov		al, color
	cmp		al, 04h
	jnz		x4
	mov		al, 02h
	jmp		x5
x4:	mov		al, 04h
x5:	mov		color, al
	jmp		x1
	

x6:	mov		ah, 07h
x7:	int		21h
	cmp		al, 'q'
	jnz		x7
	

	mov		ah, 00h
	mov		al, orig_vid_mode
	int		10h
	

.exit
end
