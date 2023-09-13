# Lab 5: Clocks and Counters
The first part of this lab is to design a 4-bit synchronous counter that uses
four T-type flip-flops. The counter increments its value by each positive
edge of the clock if `Enable` signal is asserted. This part is stored in `counter.sv`.

The second part is to design a counter that continuously displays hex values from `0-F`.
The rate is controlled by a dynamic variable called `Speed`, and the rate is calculated
by rate divider. The program is in `hex_counter.sv` and simulated using `hex_counter.do`.

The last part is to design a morse code encoder. `ClockIN` provides a constant tick. The
`LETTER` is stored as a 3-bit value, and `start` would give a single pulse indicating
the start of the output, and `NewBitOut` would start providing constant tick indicating
the start of a new bit. Each bit would last around 5 clock tick cycles. When starting 
the output, the morse code representation of `LETTER` is pulsated through an output 
variable `DotDashOut`. The dot of the morse code is shown as one bit pulse, the line 
of the morse code is shown as three bit pulses, and each signal is separated by one
bit pulse. It is stored in `morse.sv` and simulated using `morse.do`.