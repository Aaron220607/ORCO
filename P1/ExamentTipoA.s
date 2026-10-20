.data
v1: .word 100,110,120,130,140,150,160,170,180,190
v2: .zero 40
N: .word 10
.text
.globl main

main:
li t0,0 
la t1, v1
la t2, v2
li t3, 9

loop:
bge t0 ,t3 ,fin
# en t4 miramos en t1 + 0 (actual)
lw t4, 0(t1)
# en t5 miramos en t1 + 4 ( el sigiente hueco)
lw t5, 4(t1)
add t6, t4, t5
sw t6, 0(t2)
addi t1, t1, 4 # Actua como puntero en c
addi t2, t2 ,4  # Se tiene un vector en cual le debemos incremantar (bytes) para apuntar a la siguiente posicion
addi t0 , t0 ,1 
j loop


fin:
li a7, 10
ecall
