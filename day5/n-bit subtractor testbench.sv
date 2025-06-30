module n_bit_subtractor_tb;
  parameter N = 4;
  reg signed [N-1:0] a, b;
  wire signed [N-1:0] diff;
  wire borrow;
  
  n_bit_subtractor dut(
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow));
  
  initial begin
    $dumpfile("n_bit_subtractor.vcd");
    $dumpvars(0, dut);
    
    $display("Time\tA\tB\tDiff\tBorrow");
    
    a = 4'b1010; b = 4'b1101; #200;
    $display("%0t\t%b\t%b\t%b\t%b",$time,a,b,diff,borrow);
    
    $finish;
  end
endmodule