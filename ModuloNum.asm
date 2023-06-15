# MIPS - Assembly
# Gabriela Colen Castelo Borges

# Escreva um programa que leia um valor A da memória, identifique se o número é negativo ou não e 
# encontre o seu módulo. O valor deverá ser reescrito sobre A.

.text
.globl main

main:
lui $t0, 0x1001 	# t0 = 0x10010000
lw $t1, 0($t0)		# t1 = MEM[0]
sra $t2, $t1, 31	# restar apenas o sinal (f ou 0)

beq $t2, $zero, positivo # se t2 == zero, vá para positivo
sub $t1, $zero, $t1	 # se não, faça t1 - 0

positivo:
sw $t1, 0($t0)

.data
A: .word -5

