module counter(
input clk,
input reset,
input updown,
output reg q);
  
  always @ (posedge clk) begin
    if (reset) q<=0;
  	else if (updown) q<=q+1;
  	else q <= q-1;
  end
endmodule
