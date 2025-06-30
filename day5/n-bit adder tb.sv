module n_bit_adder_tb;
  parameter N = 4;
  reg [N-1:0] a, b;
  wire [N-1:0] sum;
  wire carry;
  
  n_bit_adder dut(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry));
  
  initial begin
    $dumpfile("n_bit_adder_tb.vcd");
    $dumpvars(0, n_bit_adder_tb);
    
    $display("Time\tA\tB\tSum\tCarry");
    
    a = 4'b1010; b = 4'b1101; #200;
    $display("%0t\t%b\t%b\t%b\t%b",$time,a,b,sum,carry);
    
    $finish;
  end
endmodule
