.global _start
_start:
	li s0, 0xFFFF0000 # Receiver control register at 0xFFFF0000
	li s1, 0xFFFF0004 # Receiver data register at 0xFFFF0004
	li s2, 0xFFFF0008 # Transmitter control register at 0xFFFF0008
	li s3, 0xFFFF000c # Transmitter data register at 0xFFFF000c
	POLL: 
		lw  t0, 0(s0) # Poll for key press
		andi t0, t0, 0x1
		beqz t0, POLL # continues when receiver control is 1
		lw t1, 0(s1) # Loads ASCII value into s5, s0 should automatically reset
	WAIT:
		lw t2, 0(s2)
		andi t2, t2, 0x1 
		beqz t2, WAIT # continues when transmitter control is 1
		sw t1, 0(s3)
		j POLL # Wait for next key press
END:
	ebreak

