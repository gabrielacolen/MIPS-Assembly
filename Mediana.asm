# MIPS - Assembly
# Gabriela Colen Castelo Borges

# Cálculo mediana entre 3 números da memória (a, b, c)
# Solução: ordernar esses números e pegar o do meio
# a > b, swap a - b ( 3 - 2 - 1) -> ( 2 - 3 - 1)
# b > c, swap b - c ( 2 - 3 - 1) -> ( 2 - 1 - 3)
# a > b, swap a - b ( 2 - 1 - 3) -> ( 1 - 2 - 3)

.text
.globl main

main:
lui $t0, 0x1001		# t0 = 0x10010000 (endereço base)
lw $s0, 0($t0)		# a = MEM[0]
lw $s1, 4($t0)		# b = MEM[1]
lw $s2, 8($t0)		# c = MEM[2]

slt $t1, $s0, $s1 	# se (a < b), vá para AmenorB
beq $t1, 1, AmenorB		
add $a0, $zero, $s0	# a0 = a
add $a1, $zero, $s1	# a1 = b
jal swap
add $s0, $zero, $v0
add $s1, $zero, $v1

AmenorB:
slt $t1, $s1, $s2	# se (b < c), vá para BmenorC
beq $t1, 1, BmenorC		
add $a0, $zero, $s1	# a0 = b
add $a1, $zero, $s2	# a1 = c
jal swap
add $s1, $zero, $v0
add $s2, $zero, $v1

BmenorC:
slt $t1, $s0, $s1 	# se (a < b), vá para fim
beq $t1, 1, fim		
add $a0, $zero, $s0	# a0 = a
add $a1, $zero, $s1	# a1 = b
jal swap
add $s0, $zero, $v0
add $s1, $zero, $v1
j fim

swap:
add $t2, $zero, $a0	# aux = a
add $v0, $zero, $a1	# a = b
add $v1, $zero, $t2	# b = aux
jr $ra

fim:
sw $s1, 12($t0)		# MEM[3] = mediana 

.data
a: .word 3
b: .word 1
c: .word 2
