# Lab 2: Introduction to Simulation
When doing hardware design for FPGAs and ASICs, simulation is extremely important.
When building ASICs where fabrications cost millions of dollars to build a chip, 
having a simulation allows you to get it right on first try. Furthermore, complicated 
logics for FPGA may take days and weeks to compile and build, it's a complaint that 
has existed since FPGAs were invented. 

In this course and this lab, the simulation software is called ModelSim, which is 
packaged with Intel Quartus Prime. The `wave.do` file contains the code to run the 
simulation to demonstrate `mux.sv`.

Second part of this lab is to demonstrate the discrete functionality of the mux, and 
uses solely 7400 series chips logic (AND, OR, NOT) to design a mux. The program
`discrete_mux.sv` contains the circuit-level logic of 7400s chips and a mux that uses 
those logics.

The third and last part of this lab is to write a hexadecimal decoder. The decoder 
takes 4 inputs of the FPGA board as a 4-bit binary, translates it to hex and
display it on the 7-segment HEX display. Logic is located in `hex_decoder.sv` 
![7-segment hex display](https://i.stack.imgur.com/aqZtK.png) 
![7-segment display pinout configuration](https://www.wellpcb.com/wp-content/uploads/2022/09/2-21.jpg)