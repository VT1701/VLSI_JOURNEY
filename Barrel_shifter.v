module barrel_shifter #(
  parameter WIDTH = 8)
  (
    input [WIDTH-1:0] data_in,
    input [$clog2(WIDTH)-1:0] shift_amt,
  input direction,
    output [WIDTH-1:0]data_out
  );
  
  wire [WIDTH-1:0] stage [0:$clog2(WIDTH)];
  assign stage[0] = data_in;
  genvar i;
  generate
    for (i=0;i < $clog2(WIDTH);i=i+1)
      begin : shift_loop
        assign stage[i+1] = shift_amt[i] ? (direction ? (stage[i] << (1<<i)) : (stage[i] >> (1<<i))) : stage[i];
      end
     endgenerate
     assign data_out = stage[$clog2(WIDTH)];
endmodule
                                            
      
                                           
      