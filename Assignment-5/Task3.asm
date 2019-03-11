.model tiny
.data
	file db 'NewFile.txt',0
    handle dw ?
	read_dump db 29 DUP(?)
	disp_end db '$'
	
	
.code
.startup

	;Task3
    ;Open
	MOV ah,3dh
	MOV al,00h
	LEA dx,file
	INT 21h
	MOV bx,ax

	;read
	MOV ah,3fh
	LEA dx,read_dump
	MOV cx,29
	INT 21h
	
	;display
	MOV ah,09h
	LEA dx, read_dump
	INT 21h

.exit	
end
