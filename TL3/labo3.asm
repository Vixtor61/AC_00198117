	org 	100h

section .text

	call 	texto	
	call 	cursor
	call	smsg1
	call	smsg2
	call	smsg3

	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	add	dl, [210h]
	mov 	dh, [220h] ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
	
lupi:	mov	bx, [200h]
	mov	cl, [bx+di]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, [230h]
	jb	lupi
	ret

smsg1:	mov	ax, msg1; message
	mov	[200h], ax
	mov	ax, 40d;columna
	mov	[210h], ax
	mov	ax, 3d;fila
	mov	[220h], ax
	mov	ax, len1;lenght
	mov	[230h], ax
	call 	phrase
	ret

smsg2:	mov	ax, msg2; message
	mov	[200h], ax
	mov	ax, 10d;columna
	mov	[210h], ax
	mov	ax, 11d;fila
	mov	[220h], ax
	mov	ax, len2;lenght
	mov	[230h], ax
	call 	phrase
	ret

smsg3:	mov	ax, msg3; message
	mov	[200h], ax
	mov	ax, 50d;columna
	mov	[210h], ax
	mov	ax, 19d;fila
	mov	[220h], ax
	mov	ax, len3;lenght
	mov	[230h], ax
	call 	phrase
	ret







section .data
msg1	db 	"El disco anal"
len1	equ	$-msg1
msg2	db 	"Mi waifu >>>>> tu waifu"
len2 	equ	$-msg2
msg3	db 	"Llegaste tarde mami"
len3 	equ	$-msg3