module tff_tb;
  reg clk;
  reg reset;
  reg t;
  wire q;
  
  tff dut(
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q));
  
  initial begin
    $dumpfile("tff.vcd");
    $dumpvars(0, tff_tb);
    
    $display("Time\tClk\tReset\tT\tQ");
    $monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,reset,t,q);
    
    clk=0;
    forever #5 clk = ~clk;
  end
   initial begin
     reset = 1; t = 0; #12;
     reset = 0; t = 1; #10;
     t = 1; #10;
     t = 0; #10;
     t = 1; #10;
     t = 1; #10;
     $finish;
   end
endmodule
