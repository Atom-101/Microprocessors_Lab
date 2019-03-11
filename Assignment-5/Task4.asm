.model tiny
.data
	file db 'NewFile.txt',0
    handle dw ?
	read_dump db 29 DUP(?)
	disp_end db '$'
	
	
.code
.startup

	;Task4
    ;Open
	MOV ah,3dh
	MOV al,00h
	LEA dx,file
	INT 21h
	MOV bx,ax

	;Read
    LEA dx,read_dump
X1:	MOV ah,3fh
	MOV cx,01
	INT 21h
	INC dx
	CMP ax,0000
	JNZ X1

	;display
	MOV ah,09h
	LEA dx, read_dump
	INT 21h
    
.exit	
end
