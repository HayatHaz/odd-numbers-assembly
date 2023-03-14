.data

enter: .asciiz "Enter numbers ends with 0: "
space: .asciiz "\n"
even1: .asciiz "Count of odd numbers is: "
even2: .asciiz "odd numbers are: "
tinys: .asciiz " "
arr: .word 5

.text
main:

li $s1, 0
li $s2, 0
li $s3, 2


la $a0, enter
li $v0, 4
syscall


la $s0, arr
jal read

la $a0, space
li $v0, 4
syscall

la $a0, even1
li $v0, 4
syscall

move $a0, $s1
li $v0, 1
syscall


la $a0, space
li $v0, 4
syscall


la $a0, even2
li $v0, 4
syscall

la $s0, arr
jal disply

li $v0, 10
syscall




########################

read:

loop:

li $v0, 5
syscall

move $t0, $v0

beqz $t0, end

sw $t0, 0($s0)

add $s0, $s0, 4

div $t0, $s3
mfhi $t1

bne $t1, $s2, count

j loop

count:
addi, $s1, $s1, 1
j loop


end:
jr $ra

########################

disply:

loop1:

lw $t0, 0($s0)

beqz $t0, end1
addi, $s0, $s0, 4

div $t0, $s3
mfhi $t1

bne $t1, $s2, print
j loop1

print:

move $a0, $t0

li $v0, 1
syscall

la $a0, tinys
li $v0, 4
syscall

j loop1

end1:
jr $ra
























