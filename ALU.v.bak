module ALU(clk,read_data_1,read_data_2,ALUcontrol,ALUresult);
  
  input clk;
  input [4:0] read_data_1,read_data_2;
  wire [4:0] r1,r2;
  input [3:0] ALUcontrol;
  output [4:0] ALUresult;
  reg [4:0] result;
  
  assign r1 = read_data_1;
  assign r2 = read_data_2;
  assign ALUresult = result;
  
  always@(posedge clk)
    begin
      case(ALUcontrol)
      
      0: result = r1 & r2;
         
      1: result = r1 | r2;
        
      2: result = r1 + r2;
        
      6: result = r1 - r2;
      endcase  
    end
endmodule