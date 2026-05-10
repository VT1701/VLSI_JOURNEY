module FIFO(
  input clk,
  input rst,
  input wr_en,
  input rd_en,
  input  [3:0] data_in,
  output reg [3:0] data_out ,
  output reg full,
  output reg empty
);
  
  reg [3:0] mem [7:0];
  reg [3:0] wrt_ptr;
  reg [3:0] rd_ptr;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
        wrt_ptr<= 4'b0000;
        rd_ptr<= 4'b0000;
        end
      else if ( wr_en && !full)
        begin
          mem[wrt_ptr[2:0]] <= data_in;
          wrt_ptr<= wrt_ptr+1;
        end
      else if(rd_en && !empty)
        begin
        data_out <= mem[rd_ptr[2:0]];
  
        rd_ptr <= rd_ptr+1;
        end
    end
  always@(*)
    begin
      full = (wrt_ptr[2:0] == rd_ptr[2:0]) && (wrt_ptr[3] != rd_ptr[3]);
      empty = (wrt_ptr == rd_ptr);
    end
endmodule
    
    
  