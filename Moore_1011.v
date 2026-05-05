module moore(
  input clk,
  input rst,
  input in,
  output reg out
);
  reg [2:0] state, next_state;
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  always@(posedge clk or posedge rst)
    begin
      if (rst)
        state <= S0;
      else
        state <= next_state;
    end
  always@(*)
  begin
    case(state)
      S0 : next_state = (in) ? S1 : S0;
      S1 : next_state = (in) ? S1 : S2;
      S2 : next_state = (in) ? S3 : S0;
      S3 : next_state = (in) ? S4 : S2;
      S4 : next_state = (in) ? S1 : S2;
      default : next_state = S0;
    endcase
  end
  always@(*)
    begin
      if(state == S4)
        out = 1'b1;
      else 
        out = 1'b0;
    end
endmodule
    
      
      
        
  
  