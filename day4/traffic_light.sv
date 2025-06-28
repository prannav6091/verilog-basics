module traffic_light(
  input reset,
  input clk,
  output reg red,
  output reg yellow,
  output reg green
);

  reg [1:0] current_state, next_state;
  reg [4:0] count;

  parameter RED = 2'b00;
  parameter YELLOW = 2'b01;
  parameter GREEN = 2'b10;

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      current_state <= RED;
      count <= 0;
    end else if (count == 9) begin
      current_state <= next_state;
      count <= 0;
    end else begin
      count <= count + 1;
    end
  end

  always @ (*) begin
    case (current_state)
      RED: next_state = GREEN;
      GREEN: next_state = YELLOW;
      YELLOW: next_state = RED;
      default: next_state = RED;
    endcase
  end

  always @ (*) begin
    red    = (current_state == RED);
    yellow = (current_state == YELLOW);
    green  = (current_state == GREEN);
  end

endmodule
