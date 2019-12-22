module register_bank (clk, instruction, read_register_2,read_register_1,write_data,
 MemtoRegMuxOutput, RegWrite,write_register, read_data_1, read_data_2);
 
 input [4:0] read_register_1,read_register_2,write_register,write_data;
 wire instruction[31:0],MemtoRegMuxOutput;
 output read_data_1,read_data_2;
 
 always@(posedge clk)
 begin
  if(RegWrite)
    begin
      assign write_data=MemtoRegMuxOutput;
    end
  else
    begin
     assign read_register_1=instruction[19:15];
     assign read_register_2=instruction[24:20];
     assign write_register=instruction[11:7];
    end
  
 end
 assign read_data_1=read_register_1;
 assign read_data_2=read_register_2;
 endmodule  
  
  