module universal_shift(
input clk,
input reset,
  input [1:0] mode,
  input [3:0] pin,
input sin_right,
input sin_left,
  output logic [3:0] out);
  
  always @ (posedge clk or posedge reset) begin
    if (reset)
      out <= 4'b0000;
    else
      	case (mode)
      		2'b00: out <= out;
      		2'b01: out <= {sin_right, pin[3:1]};
      		2'b10: out <= {pin[2:0], sin_left};
      		2'b11: out <= pin;
    	endcase
  	end
endmodule
