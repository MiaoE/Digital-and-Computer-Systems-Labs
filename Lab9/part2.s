.data
# Messages
msg_1: .asciz "Please take a deep breath "
msg_2: .asciz "Please drink some water "
msg_3: .asciz "Please give your eyes a break "
# Timer Related
timeNow: .word 0xFFFF0018 # current time
cmp: .word 0xFFFF0020 # time for new interrupt
counter: .word 0
.text
# Display Related
.eqv OUT_CTRL 0xffff0008
.eqv OUT 0xffff000C
.global _start
_start:
	# Loop over the messages
	# Print message to ASCII display
	# Set time to trigger interrupt to be 5000 milliseconds (5 seconds)
	lw s0, cmp
	li s1, 5000
	sw s1, 0(s0)
	# Set the handler address and enable interrupts
	mv a0, zero
	mv s0, zero
	la t0, timer_handler
	csrrw zero, utvec, t0
	csrrsi zero, ustatus, 0x1
	csrrsi zero, uie, 0x10
	li s6, 0xFFFF0008 # Transmitter control register at 0xFFFF0008
	li s7, 0xFFFF000c # Transmitter data register at 0xFFFF000c
# Loop that prints a message to OUT occasionally
LOOP:
la a0, counter
lw s1, 0(a0)
beqz s1, LOOP # Check if counter is activated to 1
la a0, counter
sw zero, 0(a0)
addi s0, s0, 1
CHECK_ONE:
	# Check if we are supposed to print
	li t1, 1
	bne s0, t1, CHECK_TWO
	# Loop through the string
	li a2, 26 # Length
	la t4, msg_1 # Starting address
	mv a4, zero # Counter
	PRINT_ONE:
		beq a4, a2, BREAK
		lb a1, 0(t4)
		jal PRINT_LETTER
		addi t4, t4, 1
		addi a4, a4, 1
		j PRINT_ONE
CHECK_TWO:
	li t1, 2
	bne s0, t1, CHECK_THREE
	# Loop through the string
	li a2, 24 # Length
	la t4, msg_2 # Starting address
	mv a4, zero # Counter
	PRINT_TWO:
		beq a4, a2, BREAK
		lb a1, 0(t4)
		jal PRINT_LETTER
		addi t4, t4, 1
		addi a4, a4, 1
		j PRINT_TWO
CHECK_THREE:
	li t1, 3
	bne s0, t1, BREAK
	# Loop through the string
	li a2, 30 # Length
	la t4, msg_3 # Starting address
	mv a4, zero # Counter
	mv s0, zero # Reset s0 to 0 
	PRINT_THREE:
		beq a4, a2, BREAK
		lb a1, 0(t4)
		jal PRINT_LETTER
		addi t4, t4, 1
		addi a4, a4, 1
		j PRINT_THREE
BREAK:
	mv a2, zero
	mv t4, zero
	mv a4, zero
	j LOOP 
	
timer_handler:
	# Push registers to the stack
	addi sp, sp, -24
	sw t1, 0(sp)
	sw t2, 4(sp)
	sw t3, 8(sp)
	sw t4, 12(sp)
	sw a0, 16(sp)
	sw a1, 20(sp)
	
	# Set cmp time to timeNow + 5000
	lw t1, timeNow
	lw t2, 0(t1)
	li t3, 5000
	add t2, t2, t3
	lw t4, cmp
	sw t2, 0(t4)
	# Increments counter
	la a0, counter
	lw a1, 0(a0)
	addi a1, a1, 1
	sw a1, 0(a0)
	# Pop registers from the stack
	lw t1, 0(sp)
	lw t2, 4(sp)
	lw t3, 8(sp)
	lw t4, 12(sp)
	lw a0, 16(sp)
	lw a1, 20(sp)
	addi sp, sp, 24
	uret

# a1 contians the ASCII value of the letter to be printed
PRINT_LETTER: 
	lw a5, 0(s6)
	andi a5, a5, 0x1
	beqz a5, PRINT_LETTER # continues when transmitter control is 1
	sb a1, 0(s7)
	jr ra

END:
	ebreak
