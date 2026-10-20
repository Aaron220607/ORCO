.data 
dni: .word 0,6,7,8,9,5,6,0
suma: .zero 4
nZeros: .zero 4
meta: .word 100
.text
.globl main
main:
li t0,0
li t1,7
la t2,suma
la t3,dni
li a3, 0
la a4, meta
la a5, nZeros


loop:
bgt t0,t1,fin
lw t4,0(t3)
lw t6,0(t2)
add t6,t6,t4
sw t6,0(t2)
beq t4, a3 , SUMAR_ZEROS
j update

SUMAR_ZEROS:
lw t5,  0(a5)
addi t5, t5, 1
sw t5, 0(a5)
j update

update:
addi t3, t3, 4
addi t0, t0, 1
j loop

fin:
lw a1, 0(a4)
lw a2, 0(t2)
sub a0, a1,a2
li a7, 1
ecall
lw a0, 0(a5)
li a7, 1
ecall
li a7, 10
ecall