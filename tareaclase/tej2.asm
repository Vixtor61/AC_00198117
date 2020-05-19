	org 100h

section .text
	 
	mov 	bx , 0d
	xor	ah , ah          
   	INT 	1ah;obtiene 
	mov  	ax , dx
	xor  	dx , dx 
;formula (1Fh*Z+Dh)%4CE3h donde Z es ax y el resultado es dx
rand:	mov	cl , 1Fh
	mul	cl
	add	ax , 0Dh
	mov	cx , 4CE3h
	xor	dx , dx;limpiamos dx para que no se pueda desbordar la division
	div	cx
	mov	ax , dx;dx(el residuo el numero aleatoreo)
	xor 	dx , dx	;limpiamos dx otra vez	
   	mov  	cx , 50d    ; se divide entre 50 y se obtiene residuo para que el numero no sea mayor a 50d
   	div  	cx
	mov	[200h+bx],dx;guardamos el resultado en la celda de memoria deseada
	inc	bx
	cmp	bx , 10d
	jb	rand 

	xor 	ax , ax;limpiar registros
	xor	bx , bx
	xor 	dx , dx
	
sum:	mov	cl , [200h+bx]	
	xor	ch , ch
	add 	ax , cx
	
	inc 	bx
	cmp	bx , 10d
	jb	sum
	mov	bl , 10d
	div	bl
	mov	[210h] , al  

	int 	20h