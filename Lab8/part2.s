# Program that counts consecutive 1’s.
.global _start
.text
_start:
	### MAIN VARIABLES ###
	# s2: Address of .words
	# s3: Length of .word
	### SORTING HELPER VARIABLES
	# s4: End Program Indicator
	# s5: Counter variable - starts at 1, terminates when s5 == s3 
	# s6: Swapped indicator - Changes to 1 if a swap occurs
	# s7: Pointer - Used to load/store words at specific address in s2
	
	la s2, LIST # Word address
	lw s3, 0(s2)
	addi s4, zero, 0 # 1 
	loop_one: # first for loop
	  mv s7, s2
	  addi s6, zero, 0 # Reset swap indicator to 0
	  addi s7, s7, 4 # Set pointer to point at .words[1]
	  addi s5, zero, 1 # Reset counter to 1
	  loop_two: # second for loop
	    beq s5, s3, exit_l2 # check condition: Terminate when s5 == len(words)
	    lw a0, 0(s7) # set param
	    jal SWAP
	    mv s6, a0
	    addi s7, s7, 4 # Increment address by 4 bits = 1 word
	    addi s5, s5, 1 # Increment counter by 1
	    j loop_two
	  exit_l2:
	  beq s6, s4, END
	  j loop_one
SWAP:
	lw a1, 4(s7) 
	bgt a0, a1, IF # SWAP if order is reversed
	mv a0, s6
	j ELSE
	IF:
	  sw a1, 0(s7)
	  sw a0, 4(s7)
	  addi a0, zero, 1
	ELSE:
	jr ra
END:
	ebreak
.global LIST
.data
LIST:
.word 7, 9, 8, 6, 8, 7, 5, 1  # first number is the total number of numbers in the list
