	
section .text

	mov	ax , [200h];10 dolares en centavos
	
    mov	bx , [210h]; 3.25 dolares en centavos
	div 	bx
	mov	[220h] , al
	int 	20h