module insMem( clk,RD_Address,data_out );
input clk;
parameter n=63;
input [n:0] RD_Address;
output reg[n:0] data_out ;
integer i =0;
reg [n:0]mem[1023:0];

initial begin
for(i=0;i<n;i=i+1)
   mem[i] <=2'b01;
end

always@(posedge clk)
  begin
   data_out =mem[RD_Address];
  end

endmodule;