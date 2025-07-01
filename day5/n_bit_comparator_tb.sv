module n_bit_comparator_tb;
  parameter N = 4;
  reg [N-1:0] a, b;
  wire equal, greater, lesser;
  
  n_bit_comparator dut(
    .a(a),
    .b(b),
    .equal(equal),
    .greater(greater),
    .lesser(lesser));
  
  initial begin
    $dumpfile("n_bit_comparator.vcd");
    $dumpvars(0, dut);
    
    $display("Time\tA\tB\tEqual\tGreater\tLesser");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,equal,greater,lesser);
    
    a = 4'b1010; b = 4'b1010; #10;
    
    $finish;
  end
endmodule