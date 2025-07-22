module register_file (
  input clk,
  input en,                  
  input [1:0] waddr,         
  input [3:0] wdata,         
  input [1:0] raddr,         
  output reg [3:0] rdata     
);

  reg [3:0] regs [3:0];  

  always @(posedge clk) begin
    if (en)
      regs[waddr] <= wdata;
  end

  always @(posedge clk) begin
    rdata <= regs[raddr];
  end

endmodule
