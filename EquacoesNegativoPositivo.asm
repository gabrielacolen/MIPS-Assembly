# MIPS - Assembly
# Gabriela Colen Castelo Borges

# y = x^3 + 1 , se x>0
# y = x^4, se x<=0

.text
.globl main

main:
lui $t0, 0x1001		# t0 = 0x10010000 (endereço base)
lw $s0, 0($t0)		# x = MEM[0]
mult $s0, $s0		# x^2
mflo $t1		
mult $s0, $t1		# x^3
mflo $t1
slt $t2, $zero, $s0	# se (x>0), t2 = 1
beq $t2, 1, positivo	# se (t1 = 1), vá para positivo
			# se não, faça:
mult $s0, $t1		# x^3
mflo $t1
addi $s1, $t1, -1	# y = x^4 - 1
j fim

positivo:
addi $s1, $t1, 1	# y = x^3 + 1

fim:
sw $s1, 4($t0)		# MEM[1] = y

.data
x: .word 0
