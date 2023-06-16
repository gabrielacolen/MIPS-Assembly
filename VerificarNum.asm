# MIPS - Assembly
# Gabriela Colen Castelo Borges

# leia número; 
# se ( 50 <= número <=100 ou 150 <= número <= 200) 
#    registrador flag = 1;
# caso contrário
#    registrador flag = 0;

.text
.globl main

main:
lui $t0, 0x1001		# t0 = 0x10010000 (endereço base)
lw $s0, 0($t0)		# x = MEM[0]
addi $t1, $zero, 50	# num = 50
add $t7, $zero, $zero	# flag = 0

slt $t2, $s0, $t1	# se (x<50) vá para a 2° parte do OR
beq $t2, 1, orTeste	
addi $t1, $zero, 100
slt $t2, $t1, $s0	#se (x>100) vá para a segunda parte do or, se não, termine
beq $t2, 1, orTeste
j true
			
orTeste:
addi $t1, $zero, 150
slt $t2, $s0, $t1	# se (x<150) vá para fim
beq $t2, 1, fim
addi $t1, $zero, 200
slt $t2, $t1, $s0	# se (x>200) vá para fim, se não, termine
beq $t2, 1, fim
j true

true:
addi $t7, $zero, 1	# por fim, flag = 1

fim:
sw $t7, 4($t0)

.data
a: .word 125
