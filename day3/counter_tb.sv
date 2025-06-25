module counter_tb;
  reg clk;
  reg updown;
  reg reset;
  wire q;
  
  counter dut(
    .clk(clk),
    .updown(updown),
    .reset(reset),
    .q(q));
  
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, counter_tb);
    
    $display("Time\tClk\tReset\tUpdown\tQ");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,updown,q);
    
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    reset = 1; updown = 1; #12;
    reset = 0; updown = 1; #50;
    updown = 0; #50;
    $finish;
  end
endmodule
