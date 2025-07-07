module piso(
input clk,
input reset,
input sin,
  output reg [3:0] sout);
  
  reg [3:0] shift_register; 
  
  always @ (posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 4'b0000;
    else begin
      sout <= {shift_register[2:0],sin};
    end
  end
endmodule