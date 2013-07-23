module t_enumerate;

// system signals
logic clk = 1'b1;

always #5ns clk = ~clk;

// integer data types
enum             {H, He, Li, Be, B, C, N} t_enumerate_int  ;
enum   bit [2:0] {A0, A1, A2, A3, A4}     t_enumerate_bit  ;
enum logic [1:0] {zero, one, two, three}  t_enumerate_logic;

// test sequence
initial begin
  repeat (4) @ (posedge clk);

  t_enumerate_int   = H ; @ (posedge clk);
  t_enumerate_int   = He; @ (posedge clk);
  t_enumerate_int   = Li; @ (posedge clk);
  t_enumerate_int   = Be; @ (posedge clk);
  t_enumerate_int   = B ; @ (posedge clk);
  t_enumerate_int   = C ; @ (posedge clk);
  t_enumerate_int   = N ; @ (posedge clk);

  t_enumerate_bit   = A0; @ (posedge clk);
  t_enumerate_bit   = A1; @ (posedge clk);
  t_enumerate_bit   = A2; @ (posedge clk);
  t_enumerate_bit   = A3; @ (posedge clk);
  t_enumerate_bit   = A4; @ (posedge clk);

  t_enumerate_logic = zero ; @ (posedge clk);
  t_enumerate_logic = one  ; @ (posedge clk);
  t_enumerate_logic = two  ; @ (posedge clk);
  t_enumerate_logic = three; @ (posedge clk);
//  t_enumerate_logic = 'x   ; @ (posedge clk);
//  t_enumerate_logic = 'z   ; @ (posedge clk);

  $finish();
end

endmodule: t_enumerate
