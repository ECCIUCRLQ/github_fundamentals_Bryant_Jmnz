;definicion de segmento de datos 
section .data
    mensajeHola: db "Hola Mundo", 10
    tamanoMensajeHola: equ $ - mensajeHola
    mensajeAdios: db "Adios Mundo", 10
    tamanoMensajeAdios: equ $ - mensajeAdios
    mensajeJapones: dw "ありがとうございました　みんなさん", 10 
    tamanoMensajeJapones: equ $ - mensajeJapones

    decision: db 0 ; representa una direccion de memoria, un puntero a byte 

    ; db -> define byte, 8 bits 1 byte
    ; dw -> define word, 16 bits 2 bytes
    ; dd -> define doubleword, 32 bits 4 bytes
    ; dq -> define quadrupleword, 64 bits 8 bytes  

    ;Ejem: 
    ; x : db 0x0C -> 0C
    ; x : dw 0x0C -> 00 0C 
    ; x : dd 0x0C -> 00 00 00 0C 
    ; x : dq 0x0C -> 00 00 00 00 00 00 00 0C 

;definicion del codigo 
section .text 
global _start 
_start: 
    ;Ahora

    mov al, 2 ; esta asignacion determina el valor de a y determinara la direccion del compare
    ; hace una operacion de comparacion, resta y modifica las EFLAGS
    cmp al, 0 ; compara el valor de 0 y el al, los envia a la alu y modifica las banderas EFLAGS

    ; Branches
    je  saludar
    ; codigo para el if false, el else 

    cmp al, [decision] 
    je agradecerJapones

    mov rsi, mensajeAdios
    mov rdx, tamanoMensajeAdios
    call imprimir
   
    ;Necesitare que se salte esta etiqueta, no son llaves! 
    jmp salir

saludar: 

    mov rsi, mensajeHola
    mov rdx, tamanoMensajeHola
    call imprimir
    
    jmp salir

; codigo para el if true 
agradecerJapones: 

    mov rsi, mensajeJapones 
    mov rdx, tamanoMensajeJapones 
    call imprimir  

salir: 

    mov rax, 60  ; devolvemos el control al sistema operativo
    mov rdi, 0 ; valor de retorno 
    syscall

imprimir:
    ;cargar la cadena e imprimirla, en rsi esta puntero a hileta, en rdx esta el tamano 
    mov rax, 1 ; imprimir algo 
    mov rdi, 1 ;salida estandar 
    syscall ; llamamos interrupcion del Sistema operativo para hacer algo --> determando por valor de rax 
    ret
