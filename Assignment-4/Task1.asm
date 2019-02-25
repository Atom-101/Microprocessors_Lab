.model tiny
.data
	uname_prompt db 'Enter User Name',0ah,'$'
	uname_max db 32
	uname_actual db ?
	uname_input db 32 dup(?)
	pwd_prompt db 0ah,'Enter Password',0ah,'$'
	pwd_max db 32
	pwd_actual db ?
	pwd_input db 32 dup(?)	
	welcome db 'Welcome ' 
	username db 'Atmadeep'
	uname_break db '$'
	password db '****'
.code
.startup
	;startup code
	STI
	XOR cx,cx
	
	;Display prompt
	LEA dx,uname_prompt
	MOV ah,09h
	INT 21h
	
	;Input username from user
	LEA dx,uname_max
	MOV ah,0ah
	INT 21h
	
	;Check for username match
	MOV cl,uname_actual
	LEA si,uname_input
	LEA di,username
	REPNE CMPSB
	JNE exit
	
	;Display password prompt
	LEA dx,pwd_prompt
	MOV ah,09h
	INT 21h
	
	;Input password from user
	LEA dx,pwd_max
	MOV ah,0ah
	INT 21h
	
	;Check for password match
	MOV cl,pwd_actual
	LEA si,pwd_input
	LEA di,password
	REPNE CMPSB
	JNE exit
	
	;Display welcome
	LEA dx,welcome
	MOV ah,09h
	INT 21h

exit:
.exit
end
	
