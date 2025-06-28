module traffic_light_tb;

  reg clk, reset;
  wire red, yellow, green;

  traffic_light dut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
  );

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(1, traffic_light_tb);

    $display("Time\tClk\tReset\tRed\tYellow\tGreen");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, reset, red, yellow, green);
    
    reset = 1; #2;
    reset = 0;

    #200;
    $finish;
  end

endmodule
