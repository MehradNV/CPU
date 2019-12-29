module shift_left(clk,extend_data,data_out);

input [63:0] extend_data;
input clk;
output reg [64:0] data_out;

always@(posedge clk)
  data_out={1'b0,extend_data};

endmodule