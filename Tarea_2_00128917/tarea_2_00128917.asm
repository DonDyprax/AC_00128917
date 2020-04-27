    org 100h

    ;Inicializando ax en 0
    mov ax, 0d

    ;Carnet: 00128917
    ;Digitos: 2,8,9,1,7
    add ax, 2d
    add ax, 8d
    add ax, 9d
    add ax, 1d
    add ax, 7d

    ;Inicializando bx en 5 para la divison
    mov bx, 5d

    ;2 + 8 + 9 + 1 + 7 = 27
    ;27 / 5 = 5.4 -> 5
    div bx

    ;Frase a escribir: "En el segundo"
    mov cl, "E"
    mov [200h], cl
    mov cl, "n"
    mov [201h], cl

    mov cl, " "
    mov [202h], cl

    mov cl, "e"
    mov [203h], cl
    mov cl, "l"
    mov [204h], cl

    mov cl, " "
    mov [205h], cl

    mov cl, "s"
    mov [206h], cl
    mov cl, "e"
    mov [207h], cl
    mov cl, "g"
    mov [208h], cl
    mov cl, "u"
    mov [209h], cl
    mov cl, "n"
    mov [20Ah], cl
    mov cl, "d"
    mov [20Bh], cl
    mov cl, "o"
    mov [20Ch], cl


    int 20h