module incrementer #(parameter N = 4)(
  input [N-1:0] a,
  output [N-1:0] result);
  
  assign result = a + 1;
endmodule