module t_string;

// system signals
logic clk = 1'b1;

always #5ns clk = ~clk;

// integer data types
string t_string; // 2-state data type, each character is equivalent to the type byte

// test sequence
initial begin
  repeat (4) @ (posedge clk);

  t_string = ""; @ (posedge clk);
  t_string = "Hello world!"; @ (posedge clk);
  t_string = "Finish."; @ (posedge clk);

  $finish();
end

endmodule: t_string
