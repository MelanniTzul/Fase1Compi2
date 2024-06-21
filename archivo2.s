.global _start
.section .data
format_str: .asciz "Current value: %d\n"

_start:
mov x0, #10 // Inicializar el contador a 10
loop:

cmp x0, #0 // Comparar x0 con 0
beq end_loop // Si x0 es 0, saltar al final del bucle
// Llamar a la subrutina print_value
bl print_value
//sub x0, x0, #1 // Decrementar el contador