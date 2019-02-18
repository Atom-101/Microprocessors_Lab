.model tiny
.386
.data
	DAT1 dw 0ef45h,4554h,0f456h,9999h,8f98h,8766h,2354h,5678h,9900h,9c44h
	COUNT db 10
	NEG1 db ?
	
.code
.startup
	MOV cl,COUNT
	LEA si,DAT1
	LEA di,NEG1
	MOV dl,00 ;stores count
X1:	MOV ax,[si] ;stores current element
	CMP ax,00	;if current greater than equal to zero, continue
	JGE X2
	INC dl	;increment count if current less than zero
X2:	INC si
	INC si
	CLC
	DEC cx
	JNZ X1
	MOV [di],dl

.exit
end
