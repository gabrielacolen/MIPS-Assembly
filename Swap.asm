# MIPS - Assembly
# Gabriela Colen Castelo Borges
# Swap 

# h = A[i]
# A[i] = A[i+1]
# A[i+1] = h

# h -> $s1
# i -> $s0
# i+1 -> $s2

.text
add $s0, $s0, 1		# i = 1

lui $t0, 0x1001		# t0 = 0x10010000
sll $s0, $s0, 2		# i = i*4
add $t1, $t0, $s0 	# end = 0x10010000 + i 
lw  $s1, 0($t1)		# h = MEM[end]             ---> A[i]

addi $s2, $s0, 4 	# t3 = i+4                 ---> i+1
add $t2, $t0, $s2	# end2 = 0x10010000 + (i+4)
lw $t4, 0($t2) 		# t4 = MEM[end2]           ---> A[i+1]
sw $t4, 0($t1)		# MEM[end] = t4            ---> A[i] = A[i+1]

sw $s1, 0($t2)		# MEM[end2] = h            ---> A[í+1] = h

.data
x0: .word 1
x1: .word 2
x2: .word 3
