module addr(input rst,input clk, input a, input j_a, input b, input j_b, output s, output j_s);
  
  wire signed[`bits:0] a;
  wire signed[`bits:0] b;
  reg  signed[`bits:0] s = 32'b0000000000000000000000000000000;
  wire signed[`bits:0] j_a;
  wire signed[`bits:0] j_b;
  reg signed [`bits:0] j_s = 32'b0000000000000000000000000000000;
  
  wire clk,rst;
  
  initial
    begin
      assign s = a + b;    
      assign j_s = j_a + j_b;
    end
    always@(posedge rst)
    begin
      s=0;
      j_s=0;
    end
endmodule
