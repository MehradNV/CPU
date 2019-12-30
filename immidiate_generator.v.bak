module immgen(clk,instruction,immgenout);
  
  input wire [31:0]instruction;
  input clk;
  output reg [63:0]immgenout;
    
  
  always@(posedge clk);
     case(instruction[6:0])
       3: immgenout = {52'b0,instruction[31:20]};
       35: immgenout = {52'b0,instruction[31:25],instruction[11:7]};
       99: immgenout = {52'b0,instruction[12],instruction[7],instruction[30:25],instruction[11:8]};
       111: immgenout = {44'b0 , instruction[31],instruction[20:12],instruction[21],instruction[30:22]};
       default: immgenout = 64'b0;
     endcase
   
   endmodule