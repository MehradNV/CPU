module multiplexer (  
  input clk,   
  input [63:0] read_data,
  input [63:0] read_data_2,  
  input selector,
  output reg [63:0] out
 );  
 
 always@(posedge clk)
 begin
  if (selector)  
    assign out = read_data; 
  else  
    assign out = read_data_2; 
 end 
 endmodule