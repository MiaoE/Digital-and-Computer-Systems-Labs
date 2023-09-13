# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in part2.sv to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using module as the top level simulation module
vsim part2

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all iteps in top level simulation module
add wave {/*}

# Setting up clock
force {Clock} 1, 0 {10 ps} -r {20 ps}
force {Reset} 1;
force {w} 0;
run 20ps

force {Reset} 0;
run 35ps

force {w} 1;
run 90ps

force {w} 0;
run 25ps

force {w} 1;
run 20ps

force {w} 0;
run 100ps