	org 100h

section .text
	mov	ax , [200h];volaje
   	mov	bx , [210h];resistencia
	mov	cx , len
	mov	di , 0d
	cmp	bx , 0
	je	er
	div 	bx	;V/R
	mov	[220h] , al
	jmp	fin
er:	mov	bl , [err+di]
	mov	[220h+di] , bl
	inc	di
	loop 	er
fin:	int 	20h
section .data
err	db	"ERROR"
len	equ	$-err