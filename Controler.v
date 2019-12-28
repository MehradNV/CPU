module Controler(clk,instruction,ALUop);
  
  input clk;
  input [31:0] instruction;
  wire [6:0] ins;
  output [1:0] ALUop;
  reg [1:0] result;
  
  assign ins = instruction[6:0];
  assign ALUop = result;
  
  always@(posedge clk)
  case(ins)
    
    51 : result = 2;
    3 : result = 0;
    35 : result = 0;
    99 : result = 1;
  endcase
    
  
endmodule