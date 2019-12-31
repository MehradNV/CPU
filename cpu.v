module cpu();
wire clk ,RegWrite,MemRead,MemWrite,memtoreg,branch,alusrc,zero;
wire [63:0] aluout,dmout,muxtoregbank,muxtopc,immgenout,muxtoalu,SLout,AdderToMuxOut,MuxToPcOut,pctoadderout,rd1,rd2;
wire [3:0] alucout;
wire [31:0]insMemOut;
wire [1:0] ALUop;
integer reset;

clock clock1(.clk(clk));

pc pc1(.clk(clk), .data_in(muxtopc) , .pcout(pcout) , .reset(reset) ,.write(1'b1));

adder PcToAdder(.clk(clk), .a(pcout), .b(adderinput), .s(pctoadderout));

insMem insMem1(.clk(clk),.RD_Address(pcout),.data_out(insMemOut));

Controler controler1(.clk(clk), .instruction(insMemOut), .Zero(zero), .ALUop(ALUop),
 .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .MemToReg(memtoreg), .ALUSrc(alusrc), .Branch(branch));
 
immgen ig( .clk(clk), .instruction(insMemOut), .immgenout(immgenout)); 
 
register_bank rb(.clk(clk), .instruction(insMemOut), .MemtoRegMuxOutput(muxtoregbank), .RegWrite(RegWrite), .read_data_1(rd1), .read_data_2(rd2));

multiplexer MuxToAlu(.clk(clk), .read_data(immgenout), .read_data_2(rd2), .selector(alusrc), .out(muxtoalu));

alu_control aluc( .ALU_Cnt(alucout), .ALUOp(ALUop), .func7(insMemOut[31:25]), .func3(insMemOut[14:12]));

shift_left SL(.clk(clk), .immgenout(immgenout), .data_out(SLout));

ALU alu( .clk(clk), .read_data_1(rd1), .read_data_2(rd2), .ALUcontrol(alucout), .ALUresult(aluout), .zero(zero));

adder AdderToMux(.clk(clk), .a(pcout), .b(SLout), .s(AdderToMuxOut));

data_memory dm( .addr(aluout), .write_data(rd2), .memwrite(MemWrite), .memread(MemRead), .clk(clk) , .read_data(dmout));

multiplexer MuxToRegBank( .clk(clk), .read_data(dmout), .read_data_2(aluout), .selector(memtoreg), .out(muxtoregbank));  

multiplexer MuxToPc(.clk(clk), .read_data(AdderToMuxOut), .read_data_2(pctoadderout), .selector(branch), .out(MuxToPcOut));
 


initial begin
	reset = 1;
	#10;
	reset = 0;
  end



endmodule
