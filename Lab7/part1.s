.global _start
.text 

_start:
    # LIST terminates with '-1'
    la s2, LIST
    addi s10, zero, 0 # Total
    addi s11, zero, 0 # Length
    lw s3, 0(s2) # Value at index 0
    li s4, -1
    for: 
        beq s3, s4, END # If condition to check if the value is '-1'
        addi s11, s11, 1 # Increment length by 1
        add s10, s10, s3 # Add s3 to total
        addi s2, s2, 4 # Get address of next index
        lw s3, 0(s2) # Load s3 with the next value of s2 which is at address s5
        j for
END:
    ebreak
.global LIST
.data
LIST:
.word 1, 2, 3, 5, 0xA, -1