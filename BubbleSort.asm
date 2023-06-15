# MIPS - Assembly
# Gabriela Colen Castelo Borges

# Considere que a partir da primeira posição livre da memória temos um vetor com 100 elementos. 
# Escrever um programa que ordene esse vetor de acordo com o algoritmo da bolha. Faça o teste colocando 
# um vetor totalmente desordenado e verifique se o algoritmo funciona. 

# tamanho do vetor (n) -> $s0
# contador (i) -> $s1
# contador (j) -> $s2

.text
.globl main

main:
lui $t0, 0x1001		# t0 = 0x10010000 (endereço base)
addi $s0, $zero, 100	# n = 100 (tamanho)

addi $s1, $zero, 0      # inicializa i = 0

forExterno:
beq $s1, $s0, fimLoopExterno	# se (i == n) vá para fimLoopExterno
sub $t1, $s0, $s1		# t1 = n - i - 1 (último elemento não precisa ser comparado)
addi $t1, $t1, -1
addi $s2, $zero, 0		# inicializa j = 0

	forInterno:		
	# Pega os elementos do array
	beq $s2, $t1, fimLoopInterno	# se (j == (n-i-1)) vá para fimLoopInterno
	sll $t2, $s2, 2			# t2 = j*4
	add $t3, $t0, $t2		# t3 = (j*4) + 0x100100000 (endereço do elemento atual)
	lw  $t4, 0($t3)			# t4 = MEM[j] (elemento atual)
	lw  $t5, 4($t3)			# t5 = MEM[j+1] (próximo elemento)
	
	# Compara os elementos e faz a troca
	slt $t6, $t5, $t4		# t6 = 1, se (A[j] > A[j+1])
	beq $t6, 1, func		# se (A[j] > A[j+1]), vá para swap
	j fimFunc
		func:
		add $a0, $zero, $t4 		# a0 = MEM[j]
		add $a1, $zero, $t5		# a1 = MEM[j+1]
		jal swap			# chama a função swap
		add $t4, $zero, $v0		# retorno do swap (elemento atual)
		add $t5, $zero, $v1		# retorno do swap (próximo elemento)
		sw  $t4, 0($t3)			# MEM[j] = t4
		sw  $t5, 4($t3)			# MEM[j+1] = t5 	
	fimFunc:
	addi $s2, $s2, 1		# j++
	j forInterno			# volta para o início do loop interno
	
	fimLoopInterno:	
	ultimoElemento:
addi $s1, $s1, 1		# i++
j forExterno



fimLoopExterno:
j fim

swap:
add $s5, $zero, $a0	# aux = MEM[j]
add $v0, $zero, $a1	# MEM[j] = MEM[j+1]
add $v1, $zero, $s5	# MEM[j+1] = aux
jr $ra

fim:

.data
array: .word 73, 6, 98, 22, 46, 31, 57, 84, 17, 61, 52, 11, 79, 39, 88, 2, 68, 44, 91, 10, 33, 64, 93, 27, 71, 55, 96, 20, 75, 1, 42, 66, 85, 13, 77, 50, 7, 38, 80, 24, 62, 35, 81, 25, 48, 70, 14, 95, 29, 60, 3, 76, 37, 90, 16, 58, 69, 23, 51, 74, 8, 63, 21, 45, 89, 34, 82, 19, 54, 92, 5, 99, 28, 72, 4, 56, 87, 12, 47, 32, 78, 26, 59, 15, 67, 30, 83, 18, 53, 94, 9, 65, 0, 43, 86, 36, 97, 49, 41, 100

