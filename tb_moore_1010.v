module tb;
  reg clk,rst,in;
  wire out;
  
  moore_1010 dut(.clk(clk),.rst(rst),.in(in),.out(out));
  
  initial 
    clk = 0;
  always
    #5 clk=~clk;
  initial 
    begin
      $monitor("Time=%0t | rst=%b , in=%b , state=%b , out=%b",$time,rst,in,dut.state,out);
      rst = 1;
      in = 0;
      
      #15 rst = 0;
      #10 in = 1;
      #10 in = 0;
      #10 in = 1;
      #10 in = 0;
      #10 in = 1;
      #10 in = 0;
      #10 in = 1;
      #10 in = 0;
      
      #20 $finish;
    end
endmodule