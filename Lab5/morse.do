# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in part2.sv to working dir
# could also have multiple verilog files
vlog part3.sv

#load simulation using module as the top level simulation module
vsim part3

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all iteps in top level simulation module
add wave {/*}

# Setting up clock
force {ClockIn} 1, 0 {1 ps} -r {2 ps}
force {Reset} 1;
force {Start} 0;
force {Letter} 3'b010;
run 6ps

force {Reset} 0;
force {Start} 0;
run 6ps

force {Start} 1;
run 2ps

force {Start} 0;
force {Letter} 3'b011;
run 500ps
