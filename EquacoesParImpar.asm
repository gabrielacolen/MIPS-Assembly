# MIPS - Assembly
# Gabriela Colen Castelo Borges

# y = x^4 + x^3 -2x^2, se x for par 
# y = x^5 – x^3 + 1, se x for impar

.text
.globl main

main:
lui $t0, 0x1001		# t0 = 0x10010000 (endereço base)
lw $s0, 0($t0)		# x = MEM[0]
addi $t1, $zero, 2	# t1 = 2

div $s0, $t1		# x/2
mfhi $t1		# t1 = resto
beq $t1, 1, impar	# se (x%2 == 1) vá para impar

mult $s0, $s0		# x^2
mflo $t1
sll  $t2, $t1, 1	# 2x^2
mult $t1, $s0		# x^3
mflo $t1
add $t3, $t1, $zero	# t3 = x^3 
mult $t1, $s0		# x^4
mflo $t1
add $t3, $t1, $t3	#t3 = x^3+x^4
sub $t2, $t3, $t2	#t3 = x^4+x^3-2x^2
j fim

impar:
mult $s0, $s0		# x^2
mflo $t1
mult $t1, $s0		# x^3
mflo $t1
add  $t2, $t1, $zero	# t2 = x^3
mult $t1, $s0		# x^4
mflo $t1
mult $t1, $s0		# x^5
mflo $t1
sub  $t2, $t1, $t2	# t2 = x^3+x^5
addi $t2, $t2, 1	# t2 = x^3+x^5+1

fim: 
sw $t2, 4($t0)

.data
x: .word 3
