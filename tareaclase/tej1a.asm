	org 100h
	
section .text

	mov	ax , 1000d;10 dolares en centavos
	mov	bx , 325d; 3.25 dolares en centavos
	div 	bx
	mov	[200h] , al
	int 	20h