module wav_interface_tb #(
  parameter int DW = 8
);

// system signals
logic clk = 1'b1;
logic rst = 1'b1;

always #5ns clk = ~clk;

// control signal
logic ctl_run = 1'b0;
logic sts_end;

// test sequence
initial begin
  repeat (4) @ (posedge clk);
  rst = 1'b0;
  repeat (4) @ (posedge clk);
  ctl_run = 1'b1;
  repeat (4) @ (posedge clk);
  ctl_run = 1'b0;
  repeat (4) @ (posedge clk);
  $finish();
end

// RTL instance
wav_interface #(
  .DW      (DW)
) dut (
  // system signals
  .clk     (clk),
  .rst     (rst),
  // input control
  .ctl_run (ctl_run),
  // output status
  .sts_end (sts_end)
);

endmodule: wav_interface_tb
