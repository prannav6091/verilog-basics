module universal_shift_tb;
  reg clk, reset, sin_right, sin_left;
  reg [3:0] pin;
  reg [1:0] mode;
  wire [3:0] out;
  
  universal_shift dut(
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .pin(pin),
    .sin_right(sin_right),
    .sin_left(sin_left),
    .out(out));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
    
  initial begin
    $dumpfile("universal_shift.vcd");
    $dumpvars(0, dut);
    
    $display("Time\tClk\tReset\tMode\tPin\tSin_right\tSin_left\tout");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,clk,reset,mode,pin,sin_right,sin_left,out);
  	
    reset = 1; #10;
    reset = 0; pin = 4'b1010; mode = 2'b10; sin_left = 1;#10;
    mode = 2'b01; sin_right = 1; #10;
    
    $finish;
  end
endmodule
