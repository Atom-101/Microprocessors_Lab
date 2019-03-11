.model tiny
.data
	newfile db 'NewFile.txt',0
	handle dw ?
	name_id db 'NAME ID'
	newline db 0dh,0ah	
	
.code
.startup
	;Task1
	;Create file
	MOV ah,3ch
	LEA dx,newfile
	XOR cx,cx
	INT 21h
	
	;Open file
	MOV al,01h
	CALL openFile
	
	;Write
	MOV ah,40h
	MOV bx,handle
	MOV cx,7
	LEA dx,name_id
	INT 21h
	
	MOV ah,40h
	MOV cx,2
	LEA dx,newline
	INT 21h
	
	MOV ah,40h
	MOV cx,7
	LEA dx,name_id
	INT 21h
	
	;Close
	CALL closeFile
	
.exit

openFile PROC NEAR
	MOV ah,3dh
	LEA dx,newfile
	INT 21h
	MOV handle,ax
	RET
openFile endp
	
closeFile PROC NEAR
	MOV ah,3eh
	MOV bx,handle
	INT 21h
	RET
closeFile endp	
	
end
