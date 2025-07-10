module piso (
  input clk,
  input reset,
  input load,
  input [3:0] pin,
  output reg sout
);

  reg [3:0] shift_reg;

  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_reg <= 0;
    else if (load)
      shift_reg <= pin;
    else
      shift_reg <= shift_reg << 1;
  end

  always @(*) begin
    sout = shift_reg[3]; // MSB goes out first
  end

endmodule
