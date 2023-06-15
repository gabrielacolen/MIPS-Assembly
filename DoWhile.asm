# MIPS - Assembly
# Gabriela Colen Castelo Borges

# j = 0; 
# i = 10; 
#  do { 
#     j = j + 1;
#  }while ( j != i );

# j -> $s0
# i -> $s1

.text
.globl main

main:
add  $s0, $zero, $zero	# j = 0
addi $s1, $zero, 10	# i = 10

loop: 
addi $s0, $s0, 1	# j = j+1
bne  $s1, $s0, loop	# if i!=j goto loop

