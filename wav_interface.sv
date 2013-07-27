// stream interface
interface wav_interface_str #(
  parameter int DW = 8
)(
  input logic clk,
  input logic rst
);

logic          tready;
logic          tvalid;
logic [DW-1:0] tdata ;

// source
modport src (
  // system signals
  input  clk,
  input  rst,
  // stream signals
  input  tready,
  output tvalid,
  output tdata
);

// drain
modport drn (
  // system signals
  input  clk,
  input  rst,
  // stream signals
  output tready,
  input  tvalid,
  input  tdata
);

endinterface: wav_interface_str




// source
module wav_interface_src (
  // control input
  input  logic ctl_run,
  // streaming interface source
  str.src      str
);

// transfer
logic trn = str.tvalid & str.tready;

// valid depends on the control run signal
always @ (posedge str.clk, posedge str.rst)
if (str.rst) str.tvalid <= 1'b0;
else         str.tvalid <= ctl_run;

// data is a counter
always @ (posedge str.clk, posedge str.rst)
if (str.rst)   str.tdata <= 'd0;
else if (trn)  str.tdata <= str.tdata + 'd1;

endmodule: wav_interface_src




// drain
module wav_interface_drn (
  // status output
  output logic sts_end,
  // streaming interface source
  str.drn      str
);

// transfer
logic trn = str.tvalid & str.tready;

assign str.tready = 1'b1;

// data is a counter
always @ (posedge str.clk, posedge str.rst)
if (str.rst)   sts_end <= 1'b0;
else if (trn)  sts_end <= str.tdata == '1;

endmodule: wav_interface_drn




// DUT module
module wav_interface #(
  parameter int DW = 8
)(
  // system signals
  input  logic clk,
  input  logic rst,
  // control input
  input  logic ctl_run,
  // status output
  output logic sts_end
);

// interface instance
wav_interface_str #(
  .DW (DW)
) stream (
  .clk (clk),
  .rst (rst)
);

// stream source
wav_interface_src src (
  // control input
  .ctl_run (ctl_run),
  // streaming interface source
  .str     (stream)
//  .str     (str.src)
);

// stream drain
wav_interface_drn drn (
  // status output
  .sts_end (sts_end),
  // streaming interface drain
  .str     (stream)
//  .str     (str.drn)
);

endmodule: wav_interface
