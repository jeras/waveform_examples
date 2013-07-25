typedef struct packed {
  logic [7:0] r,g,b;
} t_color;

module array_unpacked;

localparam int DN = 4;

// system signals
logic clk = 1'b1;
logic rst = 1'b1;

always #5ns clk = ~clk;

// data paths
t_color color [DN-1:0];
logic [7:0] r,g,b;

int i,j;

// test sequence
initial begin
  repeat (4) @ (posedge clk);
  rst = 1'b0;
  for (i='h00; i<'h10; i+=DN) begin
    for (j=0; j<DN; j++) begin
      color [j] = {3{i[7:0]}} + {3{j[7:0]}};
    end
    @ (posedge clk);
  end
  $finish();
end

// RTL instance
dut #(
  .DN    (DN)
) dut (
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

endmodule: array_unpacked


module dut #(
  parameter int DN = 1
)(
  // system signals
  input  logic       clk,
  input  logic       rst,
  // data paths
  input  t_color color [DN-1:0],
  output logic [7:0] r,g,b
);

int cnt;

always @ (posedge clk, posedge rst)
if (rst) cnt <= 0;
else     cnt <= cnt==DN-1 ? 0 : cnt+1;

always @ (posedge clk, posedge rst)
if (rst) {r,g,b} <= {3{8'h00}};
else     {r,g,b} <= color[cnt];

endmodule: dut
