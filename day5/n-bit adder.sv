module n_bit_adder #(parameter N = 4)(
  input [N-1:0] a,
  input [N-1:0] b,
  output [N-1:0] sum,
output carry);
  
  assign {sum, carry} = a + b;
endmodule
