module cpu();
wire clk ,RD_Address,data_out,pcout,ALUop,RegWrite,MemRead,MemWrite,rd1,rd2,alucout,aluout,dmout;
integer write=1,reset=0;


clock clock1(.clk(clk));

insMem insMem1(.clk(clk),.RD_Address(RD_Address),.data_out(data_out));

pc pc1(.clk(clk), .data_out(data_out) , .pcout(pcout) , .reset(reset) ,.write(write));

Controler controler1(.clk(clk), .instruction(pcout), .ALUop(ALUop),
 .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite));
 
register_bank rb(.clk(clk), .instruction(pcout), .MemtoRegMuxOutput(dmout), .RegWrite(RegWrite), .read_data_1(rd1), .read_data_2(rd2));

alu_control aluc( .ALU_Cnt(alucout), .ALUOp(ALUop), .func7(pcout[31:25]), .func3(pcout[14:12]));

ALU alu( .clk(clk), .read_data_1(rd1), .read_data_2(rd2), .ALUcontrol(alucout), .ALUresult(aluout));

data_memory dm( .addr(aluout), .write_data(rd2), .memwrite(MemWrite), .memread(MemRead), .clk(clk) , .read_data(dmout));




endmodule;
