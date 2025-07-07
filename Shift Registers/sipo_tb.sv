module piso_tb;
  reg clk, reset, sin;
  wire [3:0] sout;
  
  piso dut(
    .clk(clk),
    .reset(reset),
    .sin(sin),
    .sout(sout));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("piso.vcd");
    $dumpvars(0, piso_tb);
    
    $display("Time\tClk\tReset\tSin\tSout");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,sin,sout);
    
    reset = 1; sin = 0; #10;
    reset = 0; #10;
    sin = 1; #10;
    sin = 0; #10;
    sin = 1; #10;
    sin = 1; #10;
    
    $finish;
    
  end
endmodule