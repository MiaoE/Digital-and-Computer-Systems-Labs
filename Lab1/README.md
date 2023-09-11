This first lab is to design a multiplexer (mux) using SystemVerilog and 7400 chips.

A mux is a device that selects one of the inputs as the output. It takes some input values and a selector as the input, 
and the input indicated by the selector will be the output. The logic looks like (x, y as inputs; s as selector):
```
f=x*(~s)+y*s
```
The logic above indicates that if `s=0` the output will be `x`, otherwise (i.e. `s=1`) the output will be `y`
