module datatypes;

// system signals
logic clk = 1'b1;

always #5ns clk = ~clk;

// integer data types
shortint  t_shortint ; // 2-state data type, 16-bit signed integer
int       t_int      ; // 2-state data type, 32-bit signed integer
longint   t_longint  ; // 2-state data type, 64-bit signed integer
byte      t_byte     ; // 2-state data type, 8-bit signed integer or ASCII character
bit       t_bit      ; // 2-state data type, user-defined vector size, unsigned
logic     t_logic    ; // 4-state data type, user-defined vector size, unsigned
reg       t_reg      ; // 4-state data type, user-defined vector size, unsigned
integer   t_integer  ; // 4-state data type, 32-bit signed integer
time      t_time     ; // 4-state data type, 64-bit unsigned integer

// signed/unsigned types
logic signed   [23:0] t_logic_signed  ;
logic unsigned [23:0] t_logic_unsigned;

// real data types
real      t_real     ; // The real data type is the same as a C double.
shortreal t_shortreal; // The shortreal data type is the same as a C float.
realtime  t_realtime ; // The realtime declarations shall be treated synonymously with real declarations and can be used interchangeably. 

// test sequence
initial begin
  repeat (4) @ (posedge clk);

  t_shortint =  33; @ (posedge clk);
  t_shortint = -33; @ (posedge clk);

  t_int      =  33; @ (posedge clk);
  t_int      = -33; @ (posedge clk);

  t_longint  =  33; @ (posedge clk);
  t_longint  = -33; @ (posedge clk);

  t_byte     =  33; @ (posedge clk);
  t_byte     = -33; @ (posedge clk);

  t_bit      =  '0; @ (posedge clk);
  t_bit      =  '1; @ (posedge clk);

  t_logic    =  '0; @ (posedge clk);
  t_logic    =  '1; @ (posedge clk);
  t_logic    =  'x; @ (posedge clk);
  t_logic    =  'z; @ (posedge clk);

  t_reg      =  33; @ (posedge clk);
  t_reg      = -33; @ (posedge clk);

  t_integer  =  33; @ (posedge clk);
  t_integer  = -33; @ (posedge clk);
  t_integer  =  'x; @ (posedge clk);
  t_integer  =  'z; @ (posedge clk);

  t_time     =  33; @ (posedge clk);
  t_time     = -33; @ (posedge clk);

  t_logic_signed   =  33; @ (posedge clk);
  t_logic_signed   = -33; @ (posedge clk);

  t_logic_unsigned =  33; @ (posedge clk);
  t_logic_unsigned = -33; @ (posedge clk);

  t_real      =  33.33; @ (posedge clk);
  t_real      = -33.33; @ (posedge clk);

  t_shortreal =  33.33; @ (posedge clk);
  t_shortreal = -33.33; @ (posedge clk);

  t_realtime  =  33.33; @ (posedge clk);
  t_realtime  = -33.33; @ (posedge clk);

  $finish();
end

endmodule: datatypes
