module tb;
  reg clk,rst,wr_en,rd_en;
  reg [3:0] data_in;
  wire full,empty;
  wire [3:0] data_out;
  
  FIFO dut(.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
  
  initial 
    
    clk = 0;
  always 
    #5
    clk = ~clk;
  
  
  initial 
    begin
  $monitor("Time = %0t, rst = %b , wr_en = %b , rd_en = %b ,data_in  = %d , data_out = %d,full = %b ,empty = %b",$time,rst,wr_en,rd_en,data_in,data_out,full,empty);
  
    #10 rst = 1; wr_en = 0;rd_en = 1; data_in =0;
      
      #15 rst = 0;
      
    // Write 4 values
    #10 wr_en = 1; data_in = 4'h1;
    #10 data_in = 4'h2;
    #10 data_in = 4'h3;
    #10 data_in = 4'h4;
    #10 wr_en = 0;
    
    // Read 2 values
    #10 rd_en = 1;
    #20 rd_en = 0;
      
      #50 $finish;
    end
endmodule
    
  
  
  
  
  