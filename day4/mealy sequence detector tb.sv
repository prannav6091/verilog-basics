module mealy_tb;
  reg clk, reset, x;
  wire y;
  
  mealy dut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    $dumpfile("mealy.vcd");
    $dumpvars(0, dut);
    
    $display("Time\tClk\tReset\tX\tY");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,x,y);
    
    reset = 1; x = 0; #10;
    reset = 0;
    
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;
    x = 0; #10;
    x = 1; #10;
    x = 1; #10;
    
    $finish;
  end
endmodule