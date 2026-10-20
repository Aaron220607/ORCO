.data
v1: .word 0,6,2,6,3,1,4,5
v2: .zero 32
suma: .word 0

.text
.globl main

main:
li t0, 0
la t1, v1
la t2, v2
la t3, suma
li t4, 8
li t5, 5

li a7, 1
loop:
bge t0 ,t4 ,fin
lw t6, 0(t1)
blt t6, t5, if
j else

if:
addi a1, t6 , 10
sw a1, 0(t2)
j update

else:
addi a1, t6, -10
sw a1, 0(t2)
j update

update:
lw a2, 0(t3)
add a2, a2, t6
sw a2 , 0(t3)
addi t1, t1 , 4
addi t2, t2 , 4
addi t0, t0, 1
j loop

fin:
li a7, 1
lw a0,0(t3)
ecall
li a7, 10
ecall



