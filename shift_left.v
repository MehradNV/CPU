module shift_left(clk,immgenout,data_out);

input [63:0] immgenout;
input clk;
output reg [64:0] data_out;

always@(posedge clk)
  data_out={1'b0,immgenout};

endmodule
