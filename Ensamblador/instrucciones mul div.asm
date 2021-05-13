section .data

    num1:   dw  25
    num2:   dd  20
    num3:   dq  0

    vnum1:  dw  25, 26, 27, 28
    vnum2:  dq  25, 26, 27, 28

section .text
global _start

_start:

    ; MUL - DIV IMUL - IDIV

    ;mul <ARG>  argumento de 8 | 16 | 32 | 64 bits 


    ; a * b
    ;MUL espera en el reg A el primer operando (a)
    ;    segundo operando (b) va a ser el argumento
    ;    regA -> AL, AX, EAX, RAX

    ;11 * 11 = 1001
    ;111 * 111 = 110001
    ;...

    mul dl    ; al * dl = ax
    mul si    ; ax * si = dx:ax
    ; ax = 5, si = 1
    ; mul si --> dx: 0x00 00 ax: 0x00 05 
    mul num1        ; incorrecto
    mul word [num1] ; ax * [num1] = dx:ax
    mul word [vnum1+4] ; ax * 27 = dx:ax

    ; multiplicar 25 * 28 que están en vnum2
    mov rax, [vnum2]
    mul dqword [vnum2+24]
    ; ==
    mov rax, [vnum2]
    mov rbx, vnum2
    mul dqword [rbx+24]
    ; ==
    mov rax, [vnum2]
    mov rbx, vnum2
    mov rcx, 24
    mul dqword [rbx+rcx]

    ; DIV

    div ch  ;  ax/ch = al
            ;  res = ah

    div word [num1] ; dx:ax/word [num1] = ax
                    ; res = dx

mov rax, 60
mov rdi, 0
syscall

