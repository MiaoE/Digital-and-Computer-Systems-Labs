# Lab 9: Polling and Interrupts
Part 1 of this lab is a RISC-V program that reads characters from the keyboard and write
them to the ASCII display using the polling approach. Polling, in this context, means 
that the program constantly loops over the keyboard inputs and if there is one, it
is immediately displayed.

Part 2 is to implement interrupt to the first part of this program. The program now
has to constantly loop through 3 messages and display each with 5 second interval
while detecting inputs from the keyboard.