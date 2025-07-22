module register_file_tb;
  reg clk, en;
  reg [1:0] waddr;
  reg [3:0] wdata;
  reg [1:0] raddr;
  wire [3:0] rdata;
  
  register_file dut (
    .clk(clk),
    .en(en),
    .waddr(waddr),
    .wdata(wdata),
    .raddr(raddr),
    .rdata(rdata)
  );
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    $dumpfile("register_file.vcd");
    $dumpvars(0, dut);
    
    $display("Time\tClk\tEn\tWaddr\tWdata\tRaddr\tRdata");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, en, waddr, wdata, raddr, rdata);
    
    en = 1; #10;
    waddr = 2'b00; wdata = 4'b1111; #10;
    waddr = 2'b01; wdata = 4'b0101; #10;
    waddr = 2'b10; wdata = 4'b1101; #10;
    waddr = 2'b11; wdata = 4'b0111; #10;
    
    raddr = 2'b10; #10;
    
    $finish;
  end
endmodule
