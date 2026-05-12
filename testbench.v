module tb;
  reg clk,rst;
  wire [7:0] count;
  
  PARA_COUNTER#(.WIDTH(8)) dut(.clk(clk),.rst(rst),.count(count));
  initial
  clk=0;
  always 
    #5 clk = ~clk;
  
  initial begin
  $monitor("Time=%0t,rst = %b,count = %d",$time,rst,count);
  end
  
  initial begin
    rst = 1;
    #10 rst = 0;          
    #2700 $finish;          
  end
endmodule
