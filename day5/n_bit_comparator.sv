module n_bit_comparator #(parameter N = 4) (
  input [N-1:0] a,
  input [N-1:0] b,
output equal,
output greater,
output lesser);
  
  assign equal = (a == b);
  assign greater = (a > b);
  assign lesser = (a < b);
  
endmodule