.data
cadenaEspacios: .zero 100
msgEspacio: .string " Espacios: "
msgLongitud: .string "Longitud: "
contadorEspacios: .zero 4
longitudCadena: .zero 4

.text
.globl main

main:
li t0,0
la t1, cadenaEspacios
li t2, 0
li t3, 0
li t4, 100
li t5, 32
li a2, 10

li a7, 8
li a1, 100
mv a0,  t1
ecall

loop:
bge t0, t4, fin 
lb t6, 0(t1)
beq t6,a2,fin
beq t6, t5, if_body
j continue

if_body:
addi t2, t2, 1
j continue

continue:
addi t3, t3 , 1
addi t0, t0, 1
addi t1, t1, 1
j loop
fin:
li a7, 4
la a0, msgLongitud
ecall

li a7, 1
mv a0, t3
ecall

li a7, 4
la a0, msgEspacio
ecall

li a7, 1
mv a0, t2
ecall

li a7,10
ecall