module tw(input rst,input in,input clk, input j_in, output out, output j_out);
  
  wire signed[`bits:0] in;
  wire clk,rst;
  reg signed[`bits:0] out =  32'b00000000000000000000000000000000;
  wire signed[`bits:0] j_in;
  reg signed[`bits:0] j_out =  32'b00000000000000000000000000000000;
  
  initial
    begin
      assign out =  in<<<1;
      j_out = j_in<<<1;
    end
 
    always@(posedge rst)
    begin
      out=0;
      j_out=0;
    end
  
endmodule