	org	100h
;carnet: 00198117
section	.text
			;ej 1	
                      

        xor 	si, si 	;lo mimso que: mov si, 0000h
        mov     cx, len
lupi:	call 	kb
	jmp    is_digit
yes:    add     [res], al  
	inc 	si
        cmp 	si, len
	je	avg
	jmp 	lupi
return: call    kb
        int     20h

avg:    mov     ax, [res]     
	mov	bl, len
	div	bl
        jmp     case

kb: 	mov	ah, 1h
	int 	21h
	ret

w_string:mov     ah, 9 
        int     21h 
        ret

is_digit:cmp     al, 30h
        jb      lupi
        cmp     al, 39h
        ja      lupi
        sub     al, 30h
        jmp     yes	

case:	cmp	al,01h
	je	j1

        cmp	al,02h
	je	j2

        cmp	al,03h
	je	j3

        cmp	al,04h
	je	j4

        cmp	al,05h
	je	j5

        cmp	al,06h
	je	j6

        cmp	al,07h
	je	j7
        cmp	al,08h
	je	j8
        cmp	al,09h
	je	j9
        cmp	al,0Ah
	je	j10

j1:     mov     dx, msg1
        call    w_string
        jmp     return

j2:     mov     dx, msg2
        call    w_string
        jmp     return

j3:     mov     dx, msg3
        call    w_string
        jmp     return

j4:     mov     dx, msg4
        call    w_string
        jmp     return

j5:     mov     dx, msg5
        call    w_string
        jmp     return

j6:     mov     dx, msg6
        call    w_string
        jmp     return


j7:     mov     dx, msg7
        call    w_string
        jmp     return

j8:     mov     dx, msg8
        call    w_string
        jmp     return

j9:     mov     dx, msg9
        call    w_string
        jmp     return

j10:     mov     dx, msg10
        call    w_string
        jmp     return





section .data
msg10   db      0Ah,"Perfecto solo Dios$"

msg5	db	0Ah,"En el segundo$"

msg9    db      0Ah,"Siempre me esfuerzo$"

msg4    db      0Ah,"Me recupero$"

msg8    db      0Ah,"Colocho$"

msg3    db      0Ah,"Hay salud$"

msg7    db      0Ah, "Muy bien$"

msg2    db      0Ah,"Aun se pasa$"

msg6    db      0Ah,"Peor es nada$"

msg1    db      0Ah,"Solo necesito el 0$"

res     db      0h     

len     equ     5h      
