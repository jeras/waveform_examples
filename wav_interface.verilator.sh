#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f  wav_interface.vcd

# run Verilator to translate Verilog into C++, include C++ testbench
verilator -Wall --cc --trace wav_interface.sv --exe wav_interface_tb.cpp
# build C++ project
make -j -C obj_dir/ -f Vwav_interface.mk Vwav_interface
# run executable simulation
obj_dir/Vwav_interface

# view waveforms
#gtkwave wav_interface.vcd wav_interface.sav &
