.model tiny
.data
	file db 'NewFile.txt',0
	handle dw ?
	newline db 0dh,0ah
	hostel db 'HOSTEL ROOM'
	
	
.code
.startup	
	;Task2
	;Open file
	MOV al,02h
	CALL openFile
	
    ;Move ptr
    MOV ax,4202h
	MOV bx,handle
    MOV cx,0
    MOV dx,0
    INT 21h
	
    ;Write
    MOV ah,40h
	MOV cx,13
	LEA dx,hostel
	SUB dx,2
	INT 21h	
	CALL closeFile
	
.exit
openFile PROC NEAR
	MOV ah,3dh
	LEA dx,file
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
