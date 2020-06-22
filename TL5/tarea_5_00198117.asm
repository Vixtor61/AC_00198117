        org     100h
section .text
        call    v_mode
	call 	d_set	
	mov	ax,[mid]
	
	mov	bl,4h
	div	bl
	xor	ah,ah
	mov	[lenght], ax
	mov	[210h],ax	
	call	h_set

	mov	ax,	[lenght]
	add	[x], 	ax
	mov	ax,[mid]
	mov	[lenght],ax

	call	d_set
	mov	ax,	[mid]
	add	[x],	ax
	
	mov	ax,	[210h]
	mov	[lenght],ax
	add	word[lenght],2h	
	call	h_set
		

	call	kb
	int	20h
h_set	xor	di,	di;draws horizontal line
h_line	mov	cx,	[x]
	mov	dx,	[y]
	add	cx,	di
	inc	di
	call	pix		
	cmp	di, [lenght]
	jb	h_line
	ret

d_set	xor	di,	di;draws diagonal line
	mov	ax,	[y]
	mov	[200h], ax
	mov     ax,     [lenght]
        mov     bl,     2h
        div     bl
        mov     [mid],  al     

d_line:	xor	ax,	ax
	;mov     ax,     [x]
        mov     dx,     [y]    
        add     ax,     di
        mov     bl,     2h     
        div     bl
        xor     ah,     ah
	add	ax,	[x]
        mov     cx,     ax
        cmp     di,     [mid]
        jae     sub 
        add     dx,     di
             
sub_ret:call    pix
        inc     di
        cmp     di,     [lenght]
        jbe     d_line
	mov	ax,	[200h]
	mov	[y],	ax
	ret

kb:     mov     ah,     00h
	int	16h
        
        ret     
v_mode: mov     ah,     00h
        mov     al,	12h
        int     10h
        ret

pix:    mov     ah,     0Ch
        mov	al,     1011b
        int     10h
        ret
 
sub:    cmp     di,     [mid]
        je     set_Y_mid
sub1:   sub     dx,     di
        jmp     sub_ret

set_Y_mid:      add     dx,     [lenght]
                mov     [y],    dx
                jmp     sub1

section .data

y       dw      150d
x       dw      150d
lenght  dw     	450d ;max val 1ffh c:     
mid     db      0h
