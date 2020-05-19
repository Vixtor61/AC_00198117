	org 	100h

section .text

	call 	texto	
	call 	cursor
	mov	ax, msg; message
	mov	[200h], ax
	mov	ax, 50d;columna
	mov	[210h], ax
	mov	ax, 0d;fila
	mov	[220h], ax
	mov	ax, len;lenght
	mov	[230h], ax
	call 	phrase
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


section .data
msg	db 	"Mami que tu quiere? "
len 	equ	$-msg
msg1	db 	"Mi waifu >>>>> tu waifu"
len1 	equ	$-msg1
msg2	db 	"Caliente Caliente"
len2 	equ	$-msg2