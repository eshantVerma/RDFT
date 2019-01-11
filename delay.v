module delay(input rst,input clk, input inData, input j_inData, output outData, output j_outData);
  
  wire clk,rst;
  wire signed[`bits:0] inData;
  wire signed[`bits:0] j_inData;
  reg signed[`bits:0] outData =  32'b00000000000000000000000000000000;
  reg signed[`bits:0] j_outData =  32'b00000000000000000000000000000000;
  
  always@(posedge clk)
    begin
      #(`chash)
      j_outData = j_inData;
      outData = inData;
    end
  always@(posedge rst)
    begin
      outData=0;
      j_outData=0;
    end

endmodule