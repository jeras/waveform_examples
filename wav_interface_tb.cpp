#include "Vwav_interface.h"

#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char **argv, char **env) {
  int i, clk;

  Verilated::commandArgs(argc, argv);

  // init top verilog instance
  Vwav_interface* top = new Vwav_interface;

  // init trace dump
  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;
  top->trace (tfp, 99);
  tfp->open ("wav_interface.vcd");

  // initialize simulation inputs
  top->clk     = 1;
  top->rst     = 1;
  top->ctl_run = 0;

  // run simulation for 100 clock periods
  for (i=0; i<16; i++) {
    top->rst = (i < 4);
    // dump variables into VCD file and toggle clock
    for (clk=0; clk<2; clk++) {
      tfp->dump (2*i+clk);
      top->clk = !top->clk;
      top->eval ();
    }
    // specify the control run signal
    top->ctl_run = (i > 8) && (i < 12);
    if (Verilated::gotFinish())  exit(0);
  }
  tfp->close();
  exit(0);
}
