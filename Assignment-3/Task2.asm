.model tiny
.386
.data
	cnt1 db 10
	dat1 dd 'math','    ','bury','mine','dine','    ','hell','deep','tree'
.code
.startup
	CLD
	MOV cl, cnt1
	LEA di,dat1
	MOV eax,'    '

scan: 
	REPNE SCASD
	JE rev 
	JMP exit
	
rev: 
	MOV si,di
	X1: 
		LODSD
		CMP eax,'    '
		JE exit
		
		ROL ax, 8
		ROL eax, 16
		ROL ax, 8
		MOV [si-4],eax 

	CMP CX,0
	JNE X1
	JMP exit

exit:
	
.exit
end
