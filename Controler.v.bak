module Controler(clk,instruction,ALUop,RegWrite,MemRead,MemWrite,MemToReg);
  
  input clk;
  input [31:0] instruction;
  wire [6:0] ins;
  output reg RegWrite,MemRead,MemWrite,MemToReg;
  output reg [1:0] ALUop;
  
  
  assign ins = instruction[6:0];
  
  
  always@(posedge clk)
  case(ins)
    
    51 :begin
         ALUop = 2;
         RegWrite = 1;
         MemRead = 0;
         MemWrite = 0;
         MemToReg = 0;
        end 
        
    3 : begin
        ALUop = 0;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        MemToReg = 1;
        end
        
    35 :begin
        ALUop = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        MemToReg = 1'bx;
        end
        
    99 :begin
         ALUop = 1;
         RegWrite = 0;
         MemRead = 0;
         MemWrite = 0;
         MemToReg = 1'bx;
        end
  endcase
    
  
endmodule