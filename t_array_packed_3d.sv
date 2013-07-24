module t_array_packed_3d;

// system signals
logic clk = 1'b1;

always #5ns clk = ~clk;

// array unpacked 3D
logic [3:0] [2:0] [1:0] [7:0] array_packed_3d;

// test sequence
initial begin
  repeat (4) @ (posedge clk);

  for (int i=0; i<$size(array_packed_3d,1); i++) begin
    for (int j=0; j<$size(array_packed_3d,2); j++) begin
      for (int k=0; k<$size(array_packed_3d,3); k++) begin
        array_packed_3d [i] [j] [k] = i+j+k;
        @ (posedge clk);
      end
    end
  end

  $finish();
end

endmodule: t_array_packed_3d
