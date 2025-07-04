module incrementer_tb;
  parameter N = 4;
  reg [N-1:0] a;
  wire [N-1:0] result;
  
  incrementer dut(
    .a(a),
    .result(result));
  
  initial begin 
    $dumpfile("incrementer.vcd");
    $dumpvars(0, incrementer_tb);
    
    $display("Time\tA\tResult");
    $monitor("%0t\t%b\t%b",$time,a,result);
    
    a = 4'b1010;#10;
    
    $finish;
  end
endmodule