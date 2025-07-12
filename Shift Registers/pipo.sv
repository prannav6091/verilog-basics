module pipo (
  input clk,
  input reset,
  input load,
  input [3:0] pin,
  output reg [3:0] pout
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      pout <= 4'b0000;
    else if (load)
      pout <= pin;
  end
endmodule
