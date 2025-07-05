module siso_tb;
  reg clk, reset, sin;
  wire sout;
  
  
  siso dut(
    .clk(clk),
    .reset(reset),
    .sin(sin),
    .sout(sout));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, siso_tb);
    
    $display("Time\tClk\tReset\tSin\tSout");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,sin,sout);
    
    reset = 1; sin = 0; #10;
    reset = 0;
    
    sin = 1; #10;
    sin = 0; #10;
    sin = 1; #10;
    sin = 1; #10;
    sin = 0; #10;
    
    $finish;
  end
endmodule
