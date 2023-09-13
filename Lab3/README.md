# Lab 3:
First part is to design a 4-bit ripple carry adder in `ripple_adder.sv`, where a ripple adder circuit diagram is shown below.

![Ripple Adder block diagram](https://qph.cf2.quoracdn.net/main-qimg-468095a1533d72c633269ca6a7409f81)

![Ripple Adder circuit diagram](https://i.stack.imgur.com/BTrKe.png)

![Full Adde truth table](https://www.computersciencebytes.com/wp-content/uploads/2017/07/half_adder_truth_table_2.png)
The input ports are described below:

| module port name | direction | description |
| ----------- | ----------------- | ------------------------- |
| a | Input | 4-bit input 1 |
| b | Input | 4-bit input 2 |
| c<sub>in</sub> | Input | 1-bit carry-in |
| c<sub>out</sub> | Output | 1-bit carry-out |
| s | Output | 4-bit adder output |

Second part is to implement/design a simple ALU that requires instantiating the ripple adder from the first part. The ALU would do the following in `alu.sv`:

| module port name | direction | description |
| ----------- | ----------------- | ------------------------- |
| A | Input | 4-bit input 1 |
| B | Input | 4-bit input 2 |
| Function | Input | 2-bit input for ALU operation |
| ALUOut | Output | 8-bit output|

| Function | Output |
| ----------- | --------------------------------------- |
| 2'b00 | use part one's ripple adder to add A+B |
| 2'b01 | outputs 8'b1 if at least one bit of the two numbers is 1 using *OR* |
| 2'b10 | outputs 8'b1 if all bits of the two numbers are 1 using *AND* |
| 2'b11 | outputs most significant 4 bits of `A` and lower 4 bits of `B` |

Third part modifies the second part with dynamic ALU size in `alu_dynamic.sv`. It contains an additional variable/parameter `N` that defines the size of `A` and `B`. `N` can then be used to calculate the appropriate size of `ALUOut`.