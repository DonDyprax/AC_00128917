org	100h

section .text
        
	call    texto
    mov     dx, msg
    call 	w_strng
	call 	kb
	xor 	si, si

lupi:	
    call 	kb
	cmp 	al, "E"
	je	    validate
	mov	    bx, 5d
	sub     al, 30h
	add	    [300h], al
	inc 	si
	mov 	[305h], si 
	jmp 	lupi

texto:	
    mov 	ah, 00h
	mov	    al, 03h
	int 	10h
	ret

kb:	mov	    ah, 1h
	int 	21h	
	ret

w_strng:
    mov	    ah, 09h
	int 	21h
	ret 

w_msg:  
    call 	w_strng
	call 	kb
	int 	20h

average:	
    mov	    ax, [300h]
	mov 	bl, [305h]
	div	    bl
	mov 	[300h], al
	ret

validate:	
    mov 	dx, nl
    call    w_strng
    call	average

	cmp 	al, 1d
	je	    m1
	cmp 	al, 2d
	je	    m2
	cmp 	al, 3d
	je	    m3
    cmp 	al, 4d
	je	    m4
    cmp 	al, 5d
	je	    m5
    cmp 	al, 6d
	je	    m6
    cmp 	al, 7d
	je	    m7
    cmp 	al, 8d
	je	    m8
    cmp 	al, 9d
	je	    m9
    cmp 	al, 10d
	je	    m10

m1: 
    mov 	dx, msg1
    jmp     w_msg

m2: 
    mov 	dx, msg2
    jmp     w_msg

m3: 
    mov 	dx, msg3
    jmp     w_msg

m4: 
    mov 	dx, msg4
    jmp     w_msg

m5: 
    mov 	dx, msg5
    jmp     w_msg

m6: 
    mov 	dx, msg6
    jmp     w_msg

m7: 
    mov 	dx, msg7
    jmp     w_msg

m8: 
    mov 	dx, msg8
    jmp     w_msg

m9: 
    mov 	dx, msg9
    jmp     w_msg

m10: 
    mov 	dx, msg10
    jmp     w_msg


section .data

msg1	db	"Solo necesito el 0$"
msg2	db	"Aun se pasa$"
msg3	db	"Hay salud$"
msg4	db	"Me recupero$"
msg5	db	"En el segundo$"
msg6	db	"Peor es nada$"
msg7	db	"Muy bien$"
msg8	db	"Colocho$"
msg9	db	"Siempre me esfuerzo$"
msg10	db	"Perfecto solo Dios$"

msg	db	"Ingresar los ultimos 5 digitos de su carnet (E para finalizar): $"
nl	db 	0xA, 0xD, "$"