# MIPS - Assembly
# Gabriela Colen Castelo Borges

# Fibonacci
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ... 
# até o 46° número (maior suportado pelo emulador)

.text
.globl main

main:
lui $t0, 0x1001		# t0 = 0x10010000 (endereço base)
addi $t1, $zero, 1	# a = 1
addi $t2, $zero, 1	# b = 1
add $t4, $zero, $zero	# contador = 0

loop:
sll $t5, $t4, 3		# contador*8
add $t5, $t5, $t0	# end = end base + contador*8
beq $t4, 23, fim	# se (contador == 100), vá para fim
add $t1, $t1, $t2	# a = a + b
add $t2, $t1, $t2	# b = a + b
addi $t4, $t4, 1	# contador++

sw $t1, 0($t5)		
sw $t2, 4($t5)
j loop

fim:

.data

