module piso_tb;
  reg clk, reset, load;
  reg [3:0] pin;
  wire sout;

  piso dut (
    .clk(clk),
    .reset(reset),
    .load(pin),
    .pin(pin),
    .sout(sout)
  );

  // Clock generation: 10 time units period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("piso.vcd");
    $dumpvars(0, piso_tb);

    $display("Time\tPin\tLoad\tSout");

    reset = 1; load = 0; pin = 4'b1011; #10;
    reset = 0; load = 1; #10;
    load = 0;

    repeat (4) begin
      #10 $display("%0t\t%b\t%b\t%b", $time, pin, load, sout);
    end

    $finish;
  end
endmodule
