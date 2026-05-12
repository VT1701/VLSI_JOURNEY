module tb;
  reg [7:0] data_in;
  reg [2:0] shift_amt;
  reg direction;
  wire [7:0] data_out;
  
  barrel_shifter dut(.data_in(data_in), .shift_amt(shift_amt), .direction(direction), .data_out(data_out));
  
  initial begin
    $monitor("in=%8b | shift=%d dir=%b | out=%8b", data_in, shift_amt, direction, data_out);
    data_in=8'b11010110; shift_amt=3; direction=0; #10;  
    data_in=8'b00110101; shift_amt=2; direction=1; #10;  
    data_in=8'b10101010; shift_amt=0; direction=0; #10;
    $finish;
  end
endmodule