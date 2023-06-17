# MIPS - Assembly
# Gabriela Colen Castelo Borges

# leia número; 
# se ( 50 <= número <=100 ou 150 <= número <= 200) 
#    registrador flag = 1;
# caso contrário
#    registrador flag = 0;
# MIPS - Assembly
# Gabriela Colen Castelo Borges

.text
.globl main

main:
    lui $t0, 0x1001    # t0 = 0x10010000 (endereço base)
    lw $s0, 0($t0)     # x = MEM[0]
    addi $t7, $zero, 0 # flag = 0
    
    slt $t1, $s0, 50    # t1 = (x < 50)
    slt $t2, $s0, 100   # t2 = (x < 100)
    or $t1, $t1, $t2    # t1 = (x < 50) or (x < 100)
    slt $t2, $s0, 150   # t2 = (x < 150)
    slt $t3, $s0, 200   # t3 = (x < 200)
    or $t2, $t2, $t3    # t2 = (x < 150) or (x < 200)
    or $t1, $t1, $t2    # t1 = (x < 50) or (x < 100) or (x < 150) or (x < 200)
    
    beq $t1, $zero, falso # se (flag == 0) vá para falso
    addi $t7, $zero, 1    # flag = 1
    
falso:
    sw $t7, 4($t0)     # MEM[4] = flag
    
.data
a: .word 125
