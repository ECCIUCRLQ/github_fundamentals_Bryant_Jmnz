; Tenemos dos secciones
; Seccion 1 data. Defino el segmento de datos 
section .data

    mensaje:    db "Welcome home Mr.Stark", 10  ; mensaje puntero a memoria 
    ; db formato en el que quiero guardar define bit
    ; dw define word  dd define doubleword dq define quadrupleword
    tamano:     equ $ - mensaje ; $ (posicion actual de memoria)
    ; equ es para hablar de constantes definimos el tamano 

; Seccion 2 texto. Defino el codigo fuente
section .text

global _start
;global es como estar en public y el start debe estar definido aqui antes de 

_start:
; simbolo inicial que para linux es _start, algo asi como el main

    ; cargar la cadena e imprimirla, en rsi esta a puntero a hilera, en rdx esta el tamano 
    mov rax, 1 ; imprimir algo 
    mov rdi, 1  ; en salida estandar

    ;mov toma el valor 1 y lo asigna al registro. 
    ;instruccion destino, fuente

    ;registros 64 bits (r)
    mov rsi, mensaje ; copio la direccion del primer caracter de mensaje a rsi 
    mov rdx, tamano ; se va a mover 

    ;mensaje: db "hola" mensaje son punteros a memoria
    ;mensaje2: db "mundo!"
    ;mensaje3: db "cuel" 
    ; donde el orden importa, dado que son punteros y no variables
    ;

    syscall ;llamamos interrupcion del Sistema operatico para hacer algo --> por rax

    mov rax, 60 ; devolvemos el control al sistema operativo
    mov rdi, 0 ; return sin error 
    syscall ; llamamos interrupcion del sistema operativo para hacer algo --> por rax que tiene 60 para finalizar 