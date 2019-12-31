module ALU(clk,read_data_1,read_data_2,ALUcontrol,ALUresult,zero);
  
  input clk;
  input [63:0] read_data_1,read_data_2;
  wire [63:0] r1,r2;
  input [3:0] ALUcontrol;
  output reg [63:0] ALUresult;
  output reg zero;
  
  assign r1 = read_data_1;
  assign r2 = read_data_2;

  
  always@(posedge clk)
    begin
      case(ALUcontrol)
      
      0: ALUresult = r1 & r2;
         
      1: ALUresult = r1 | r2;
        
      2: ALUresult = r1 + r2;
        
      6: ALUresult = r1 - r2;
      
      endcase 
      
      if(ALUresult == 0)
        zero = 1;
      else
        zero = 0;
       
    end
endmodule