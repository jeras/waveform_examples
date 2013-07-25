typedef union packed {
  struct rgb565 {
    logic [4:0] r;
    logic [5:0] g;
    logic [4:0] b;
  };
  [1:0][7:0] byte_pair;
} t_union_packed;

module union_packed;

// system signals
logic clk = 1'b1;

always #5ns clk = ~clk;

// union typoe instance
t_union_packed union_packed;

// test sequence
initial begin
  repeat (4) @ (posedge clk);

  // access to structure
  union_packed.rgb565   =  '0      ; @ (posedge clk);
  union_packed.rgb565.r = 5'b10001 ; @ (posedge clk);
  union_packed.rgb565.g = 6'b110010; @ (posedge clk);
  union_packed.rgb565.b = 5'b00011 ; @ (posedge clk);
  // access to array
  union_packed.byte_pair    = '1; @ (posedge clk);
  union_packed.byte_pair[0] =  0; @ (posedge clk);
  union_packed.byte_pair[1] =  1; @ (posedge clk);

  $finish();
end

endmodule: union_packed
