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

j5:	mov	cx, mlen5
	mov 	ax, msg5
	jmp	lupi

lupi:	mov	bx, ax
	mov	bl, [bx+di]
	mov	[di+200h], bl
	inc	di
	loop	lupi

section .data

msg5	db	"En el segundo"
mlen5	equ	$ - msg5

section	.text
			;carnet: 00198117
			;ej 2 
	mov	bx, 2			
	mov 	ax, 4d
	mov	cx, 11
	mov	si, 0d
	
	mov	al,4d
l1:	mov	[210h+si], ax	
	mul	bx
	cmp	ax,256d
	ja	jmp2
	inc	si
	jmp	jmp3
jmp2:	add	si,2d
jmp3:	loop	l1
	
section .text
			;ej 3
	mov	ax, 0001h			
	mov 	bx, 0000h
	mov	cx, 13
	mov	[220h],bx
	mov	[221h],ax
	mov	si,1d	

l2:	mov	dx,ax
	add	ax,bx
	mov	bx,dx
	cmp	bx,256d
	ja	jmp12
	inc	si
	jmp	jmp13
jmp12:	add	si,2d
jmp13:	mov	[220h+si],ax
	loop	l2
	int 20h



