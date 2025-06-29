module mealy(
input clk,
input reset,
input x,
output reg y);
  
  reg [1:0] current_state, next_state;
  
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  
  always @ (posedge clk or posedge reset) begin
    if (reset)
      current_state <= S0;
    else
      current_state <= next_state;
  end
  
  always @ (*) begin
    case (current_state)
      S0: begin
        if (x) begin
          next_state = S1;
          y = 0;
        end
        else begin
          next_state = S0;
          y = 0;
        end
      end
      S1: begin
        if (x) begin
          next_state = S1;
          y = 1;
        end
        else begin
          next_state = S0;
          y = 0;
        end
      end
    endcase
  end
endmodule