	org	100h

section	.text
			;carnet: 00198117
;ej 1			
	mov	di, 0d
	mov	cx, 0000h
	mov	ax, 0000h
	add	ax, 9
	add	ax, 8
	add	ax, 1
	add	ax, 1
	add	ax, 7
	mov	bl, 5d
	div	bl

	cmp	al,5
	je	j5
	cmp	al,10
	je	j10
	cmp	al,9
	je	j9
	cmp	al,8
	je	j8
	cmp	al,7
	je	j7
	cmp	al,6
	je	j6
	cmp	al,4
	je	j4
	cmp	al,3
	je	j3
	cmp	al,2
	je	j2
	cmp	al,1
	je	j1

j10:	mov	cx, mlen10
	mov 	ax, msg10
	mov 	[301h], ax
	jmp	lupi	
j9:	mov	cx, mlen9
	mov 	ax, msg9
	mov 	[301h], ax
	jmp	lupi	
j8:	mov	cx, mlen8
	mov 	ax, msg8
	mov 	[301h], ax
	jmp	lupi	
j7:	mov	cx, mlen7
	mov 	ax, msg7
	mov 	[301h], ax
	jmp	lupi				

j6:	mov	cx, mlen6
	mov 	ax, msg6
	mov 	[301h], ax
	jmp	lupi	

j5:	mov	cx, mlen5
	mov 	ax, msg5
	mov 	[301h], ax
	jmp	lupi

j4:	mov	cx, mlen4
	mov 	ax, msg4
	mov 	[301h], ax
	jmp	lupi

j3:	mov	cx, mlen3
	mov 	ax, msg3
	mov 	[301h], ax
	jmp	lupi		

j2:	mov	cx, mlen2
	mov 	ax, msg2
	mov 	[301h], ax
	jmp	lupi	

j1:	mov	cx, mlen1
	mov 	ax, msg1
	mov 	[301h], ax
	jmp	lupi



lupi:	
	mov	bx, [301h]
	mov	bl, [bx+di]
	mov	[di+200h], bl
	inc	di
	loop	lupi

	int	20h

section .data

msg10	db	"Perfecto solo Dios"
mlen10	equ	$ - msg10

msg9	db	"Siempre me esfuerzo"
mlen9	equ	$ - msg9

msg8	db	"Colocho"
mlen8	equ	$ - msg8

msg7	db	"Muy bien"
mlen7	equ	$ - msg7

msg6	db	"Peor es nada"
mlen6	equ	$ - msg6

msg5	db	"En el segundo"
mlen5	equ	$ - msg5

msg4	db	"Me recupero"
mlen4	equ	$ - msg4

msg3	db	"Hay Salud"
mlen3	equ	$ - msg3

msg2	db	"Aun se pasa"
mlen2	equ	$ - msg2

msg1	db	"Solo necesito el 0"
mlen1	equ	$ - msg1 


