module mealy_1011 (
  input  clk,
  input  rst,
  input  in,
  output reg out
);

  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  reg [1:0] state, next_state;
  
  // Block 1: State register
  always@(posedge clk or posedge rst) begin
    if (rst)
      state<=S0;
    else
      state<=next_state;
        
  end
  
  // Block 2: Next state logic — 4 cases (no S4)
  always@(*) begin
    case (state)
      S0 : next_state = (in) ? S1:S0;
      S1 : next_state = (in) ? S1:S2;
      S2 : next_state = (in) ? S3:S0;
      S3 : next_state = (in) ? S1:S2;
      default: next_state = S0;  
    endcase
  end
  
  // Block 3: Mealy output logic
  always@(*) begin
     if ((state == S3) && (in == 1))
      out = 1'b1;
    else 
      out = 1'b0;
  end
    
    // YOU FILL THIS — depends on state AND input
 
endmodule