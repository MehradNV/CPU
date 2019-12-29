module cpu();
wire clk ,RD_Address,ALUop,RegWrite,MemRead,MemWrite,rd1,rd2,alucout,aluout,dmout,muxout,memtoreg;
integer write=1,reset=0;
wire [31:0]pcout;
wire [31:0]data_out;
reg [63:0]data_in;


clock clock1(.clk(clk));

pc pc1(.clk(clk), .data_in(data_in) , .pcout(pcout) , .reset(reset) ,.write(write));

insMem insMem1(.clk(clk),.RD_Address(pcout),.data_out(data_out));



Controler controler1(.clk(clk), .instruction(data_out), .ALUop(ALUop),
 .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .MemToReg());
 
register_bank rb(.clk(clk), .instruction(data_out), .MemtoRegMuxOutput(muxout), .RegWrite(RegWrite), .read_data_1(rd1), .read_data_2(rd2));

alu_control aluc( .ALU_Cnt(alucout), .ALUOp(ALUop), .func7(data_out[31:25]), .func3(data_out[14:12]));

ALU alu( .clk(clk), .read_data_1(rd1), .read_data_2(rd2), .ALUcontrol(alucout), .ALUresult(aluout));

data_memory dm( .addr(aluout), .write_data(rd2), .memwrite(MemWrite), .memread(MemRead), .clk(clk) , .read_data(dmout));

multiplexer mux( .clk(clk), .read_data(dmout), .read_data_2(aluout), .MemToReg(memtoreg), .out(muxout));  
 




endmodule
