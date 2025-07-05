module siso(
input clk,
input reset,
input sin,
output reg sout);
  
  reg [3:0] shift_register;
  
  always @ (posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 4'b0000;
    else begin
      shift_register <= {sin,shift_register[3:1]};
      sout <= shift_register[0];
    end
  end
endmodule
