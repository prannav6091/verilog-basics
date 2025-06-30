module n_bit_subtractor #(parameter N = 4)(
  input signed [N-1:0] a,
  input signed [N-1:0] b,
  output signed [N-1:0] diff,
output borrow);
  
  assign {borrow, diff} = a - b;
endmodule