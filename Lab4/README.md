# Lab 4: Latches, Flip-flops, and Registers
The goal is to design an ALU which includes registers to store values. Registers 
are sequential storage elements consisting of several D flip-flops working in unison. 

For this ALU, edge-triggered D flip-flops is used, and is designed using leader-follower
flip-flop method which connects two D latches in series with the two D latches using
opposite edges of the clock. A gated D-latch using the 7400s chips circuit diagram is shown below:
![Gated D-Latch circuit diagram](https://media.geeksforgeeks.org/wp-content/uploads/d_ltch.png)

The operation of ALU is described below:

| Function | Output |
| ----------- | --------------------------------------- |
| 2'b00 | A + B |
| 2'b01 | A * B |
| 2'b10 | left shift `B` by `A` bits using the shift operator |
| 2'b11 | holds the current value in the register |

In addition, a sequential logic element rotating register is also designed. For this lab,
a 4-bit rotating register is designed, where bits shift right upon rising edge of the clock.
How this design should work is described below:

1. When `ParallelLoadn = 0`, the value of `Data_IN` is stored in the flip flops on the next positive clock edge.
2. When `ParallelLoadn = 1`, `RotateRight = 1` and `ASRight = 0` the bits of the register rotate to the right on each positive clock edge:
Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>Q<sub>0</sub>
Q<sub>0</sub>Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>
Q<sub>1</sub>Q<sub>0</sub>Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>
3. When `ParallelLoadn = 1`, `RotateRight = 1` and `ASRight = 1` the bits of the register rotate to the right on each positive clock edge but the most significant bit is copied. This is called an Arithmetic shift right:
Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>Q<sub>0</sub>
Q<sub>7</sub>Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>
Q<sub>7</sub>Q<sub>7</sub>Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>
4. When `ParallelLoadn = 1` and `RotateRight = 0`, the bits of the register rotate to the left on each positive clock edge. `ASRight` is ignored:
Q<sub>7</sub>Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>Q<sub>0</sub>
Q<sub>6</sub>Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>Q<sub>0</sub>Q<sub>7</sub>
Q<sub>5</sub>Q<sub>4</sub>Q<sub>3</sub>Q<sub>2</sub>Q<sub>1</sub>Q<sub>0</sub>Q<sub>7</sub>Q<sub>6</sub>