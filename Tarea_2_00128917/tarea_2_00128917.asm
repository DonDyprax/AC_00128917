        ;Ejercicio 1
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

        ;Ejercicio 2
        org 100h

        ;Inicializando los registros
        mov ax, 0d
        mov cx, 0d

        ;Inicializando el contador
        mov si, 0d

        ;Condiciones iniciales: Casos en dia 1: 2
        ;                       Casos en dia 3: = 2*2 = 4

        mov ax, 4d
        ;Factor por el cual se incrementan los casos
        mov cx, 2d

single: ;Inicializando la sucesion
        mov [si + 210h], ax
        mul cx

        ;Incrementando el acumulador
        inc si

        ;Evaluando si el numero excede el limite de 255
        cmp ax, 255d

        jbe single

double: mov [si + 210h], ax
        mul cx
        
        ;Doble incremento por utilizar dos celdas de memoria
        inc si
        inc si

        cmp si, 16d

        jne double

        int 20h;

        ;Ejercicio 3
        org 100h

        ;Inicializando los registros en las conidicones iniciales
        ;   a0 = 0 ^ a1= 1
        mov ax, 0d
        mov bx, 1d

        ;Inicializando el contador en 0
        mov si, 0d

        mov cx, 0d
        mov dx, 3d

        ;Insertando los valores iniciales
        mov [si + 220h], ax
        inc si

        mov [si + 220h], bx
        inc si

        ;Calculando el valor siguiente
        add ax, bx
        mov [si + 220h], ax
        inc si

aux:    mov cx, ax
        add ax, bx

        mov bx, cx
        mov [si +220h],  ax
        inc si
        inc dx

        cmp dx, 000Fh
        jb aux

        int 20h
