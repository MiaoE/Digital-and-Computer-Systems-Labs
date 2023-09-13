# Program that counts consecutive 1’s.
.global _start
.text
_start:
	### VARIABLES ###
	la s2, LIST 
	li s3, -1
	addi s10, zero, 0 # Maximum ONES output
	lw a2, 0(s2) # Word content
	### START ###
	for:
	  beq a2, s3, END 
	  jal ONES
	  bge a0, s10, IF
	  j ELSE
	  IF: mv s10, a0 # Set s4 equal to s2
	  ELSE:
	  addi s2, s2, 4
	  lw a2, 0(s2)
	  j for

ONES:
	### PARAMETERS ###
	# a2: Word content
	### HELPERS ###
	# a3: Bitwise AND
	### RETURN ###
	# a0: Maximum number of consecutive ones
	addi a0, zero, 0 #
	addi a3, zero, 0
	for_ones:
	  beqz a2, done_ones # Loop until data contains no more 1’s
	  srli a3, a2, 1 
	  and a2, a2, a3
	  addi a0, a0, 1 # Count the string lengths so far
	  j for_ones
	done_ones:
	  jr ra
END:
	ebreak
.global LIST
.data
LIST:
.word 0x1fffffff, 0x12345678, 0x00000000, 0x0000F000, 0x1FE00000, -1, 0x7fffffff
