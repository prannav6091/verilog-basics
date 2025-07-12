module pipo_tb;
  reg clk, reset, load;
  reg [3:0] pin;
  wire [3:0] pout;

  pipo dut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .pin(pin),
    .pout(pout)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(0, pipo_tb);

    $display("Time\tLoad\tPin\tPout");
    $monitor("%0t\t%b\t%b\t%b", $time, load, pin, pout);

    reset = 1; load = 0; pin = 4'b0000; #10;
    reset = 0; load = 1; pin = 4'b1010; #10;
    load = 0; pin = 4'b1111; #10;
    load = 1; pin = 4'b1100; #10;
    $finish;
  end
endmodule
