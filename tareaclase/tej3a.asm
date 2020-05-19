	org 100h

section .text
	mov	ax , 120d;volaje
   	mov	bx , 60d;resistencia 
	div 	bx	;V/R
	mov	[220h] , al
	int 	20h