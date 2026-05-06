module tb;
  reg clk,rst,in;
  wire out;
  
  mealy_1011 dut(.clk(clk),.rst(rst),.in(in),.out(out));
  initial 
    clk = 0;
always #5
  clk = ~clk;
  initial 
    begin
      $monitor("Time = %0t, rst = %b , in = %b , out = %b",$time,rst,in,out);
      rst = 1; in = 0;
      #15 rst = 0;
      #10 in =1;
      #10 in = 0;
      #10 in = 1;
      #10 in = 1;
      #10 in = 1;
      #10 in = 0;
      #10 in = 1;
      #10 in = 0;
      #10 in = 1;
      #10 in = 1;
      #10 in = 1;
      
      #50 $finish;
      
    end
endmodule