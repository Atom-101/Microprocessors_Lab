.model tiny

.data
	ARRAY1 db 45h,54h,0f4h,56h,99h,0f9h,0f0h,87h,66h,23h,54h,0f3h,0f6h,9ch,0feh
	GREAT1 db ?
	
.code
.startup
	MOV cl,15
	LEA si,ARRAY1
	LEA di,GREAT1
	MOV ah,[si] ;stores greatest
X1:	MOV al,[si] ;stores current element
	cmp al,ah	;if current lesser than greatest, continue
	jb X2
	MOV ah,al	;if current greater or equal to greatest, overwrite greatest
X2:	INC si
	clc
	dec cx
	jnz X1
	MOV [di],ah

.exit
end
