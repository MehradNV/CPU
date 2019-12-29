module multiplexer (  
  input clk,   
  input [31:0] read_data,
  input [31:0] read_data_2,  
  input [1:0] MemToReg,
  output reg [31:0] out
 );  
 
 always
 begin
  if (MemToReg)  
    assign out = read_data_2; 
  else  
    assign out = read_data; 
 end 
 endmodule