typedef struct packed {
  logic [7:0] r,g,b;
} t_color;

module struct_packed;

// system signals
logic clk = 1'b1;
logic rst = 1'b1;

always #5ns clk = ~clk;

// data paths
t_color color;
logic [7:0] r,g,b;

int i;

// test sequence
initial begin
  repeat (4) @ (posedge clk);
  rst = 1'b0;
  for (i='h00; i<'h10; i++) begin
    color = {3{i[7:0]}};
    @ (posedge clk);
  end
  $finish();
end

// RTL instance
dut dut (
  // system signals
  .clk   (clk),
  .rst   (rst),
  // input structure
  .color (color),
  // output vectors
  .r     (r),
  .g     (g),
  .b     (b)
);

endmodule: struct_packed


module dut (
  // system signals
  input  logic       clk,
  input  logic       rst,
  // data paths
  input  t_color     color,
  output logic [7:0] r,g,b
);

always @ (posedge clk, posedge rst)
if (rst) {r,g,b} <= {3{8'h00}};
else     {r,g,b} <= color;

endmodule: dut
