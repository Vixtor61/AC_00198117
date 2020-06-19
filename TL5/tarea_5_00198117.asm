        org     100h
section .text
        xor     di,     di
        call    v_mode
        mov     ax,     [lenght]
        mov     bl,     2h
        div     bl
        mov     [mid],  al     


ma_loop:mov     ax,     [x]
        mov     dx,     [y]    
        add     ax,     di
        mov     bl,     2h     
        div     bl
        xor     ah,     ah
        mov     cx,     ax
        cmp     di,     [mid]
        jae     sub 
        add     dx,     di
             
sub_ret:call    pix
        inc     di
        cmp     di,     [lenght]
        jbe     ma_loop
        call    kb
        int     20h

kb:     mov     ah,     00h

        int     20h
        ret     
v_mode: mov     ah,     00h
        mov     al,     12h
        int     10h
        ret

pix:    mov     ah,     0Ch
        mov	al,     1010b
        int     10h
        ret
 
sub:    cmp     di,     [mid]
        je     set_Y_mid
omg:    sub     dx,     di
        jmp     sub_ret

set_Y_mid:      add     dx,     [lenght]
                mov     [y],    dx
                jmp     omg

section .data

y       dw      200d
x       dw      200d
lenght  dw      100h     
mid     db      0h