# Lab 6: Finite State Machines
The goal of this lab is to design a finite state machine (FSM) and learn 
how to use FSM to control the sequencing of logical operations. 

The first part will implement a basic finite state machine (FSM) with an input `w` and an 
output `z`, that recognizes two specific sequences of inputs. When `w = 1` for four consecutive clock pulses, 
or when the sequence `1101` appears on `w` across four consecutive clock cycles, the value of `z` has to be `1`; 
otherwise, `z = 0`. Overlapping sequences are allowed, so that if `w = 1` for five consecutive clock cycles
the output `z` will be equal to `1` after the fourth and fifth cycles. This part is stored in `part1.sv`
and simulated using `part1.do`.

The second part must design an ALU which can be used to calculate equations that involve
several additions and multiplications. This is designed using control paths
and datapaths, which are used to implement more complex hardware designs. This part is stored
in `part2.sv` and simulated with `part2.do`.

### What are datapaths and control paths
Most non-trivial digital circuits can be separated into
two main functions. One is the datapath where the data flows and the other is the control
path that manipulates the signals in the datapath to control the operations performed and
how the data flows through the datapath. Previous labs constructed simple ALUs, which is a 
common datapath component. Part I of this lab already constructed a simple FSM, which is 
the most common component used to implement a control path. 

