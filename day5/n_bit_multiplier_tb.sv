module n_bit_multiplier_tb;
  parameter N = 4;
  reg [N-1:0] a, b;
  wire [(2*N)-1:0] product;
  
  n_bit_multiplier dut(
    .a(a),
    .b(b),
    .product(product));
  
  initial begin
    $dumpfile("n_bit_multiplier.vcd");
    $dumpvars(0, n_bit_multiplier_tb);
    
    $display("Time\tA\tB\tProduct");
    
    a = 4'b1010; b = 4'b1101; #200;
    $display("%0t\t%b\t%b\t%b",$time,a,b,product);
    
    $finish;
  end
endmodule