module adder(clk,a,b,s);
  input a,b,clk;
  output reg s;
  
  always@(posedge clk)
    s = a + b;
    
  endmodule