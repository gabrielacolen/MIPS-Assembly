# MIPS - Assembly
# Gabriela Colen Castelo Borges

# Escreva um programa que leia da memória um valor de Temperatura TEMP. Se TEMP>=30 e TEMP 
# <=50 uma variável FLAG, também na memória, deverá receber o valor 1, caso contrário, FLAG deverá 
# ser zero

.text
.globl main

main:
lui  $t0, 0x1001 	# t0 = 0x10010000
lw   $s0, 0($t0)	# TEMP = MEM[0]
addi $t1, $zero, 30	# t1 = 30
addi $t2, $zero, 50	# t2 = 50

slt $s1, $s0, $t1	# flag = 1, if (TEMP < 30)
beq $s1, 1, else	# flag = 1, vá para o else
slt $s1, $t2, $s0	# flag = 1, if (TEMP > 50)
beq $s1, 1, else	# flag = 1, vá para else

beq $s1, 0, trocarUm	# flag = 0, vá para trocarUm
j fim

trocarUm:
addi $s1, $zero, 1	# se não, flag = 1 (resposta final se for certo)
j fim

else:
add $s1, $zero, $zero	# se não, flag = 0 (se não for certo)

fim:

.data
TEMP: .word 51
FLAG: .word 0

