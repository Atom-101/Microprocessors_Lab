;ALP to store count of '    '(4 spaces) in dat1

.model tiny
.386
.data
	cnt1 db 11
	dat1 dd '    ','math','    ','bury','mine','dine','    ','hell','deep','tree'
	res db ?
.code
.startup
	CLD
	MOV cl, cnt1
	XOR bx,bx ;store count of 4 spaces
	LEA di,dat1
	MOV eax,'    '

X1:	repne scasd
	JE X2
	CMP CX,0
	JNE X1
	JMP exit
	
X2:	INC bx
	CMP CX,0
	JNE X1
	JMP exit

exit:
	MOV res,bx
	
.exit
end
