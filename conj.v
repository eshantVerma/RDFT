module conj(input clk, input in, input j_in, output out, output j_out);
  
  wire clk;
  wire signed[`bits:0] in;  
  reg signed[`bits:0] out =  32'b00000000000000000000000000000000;
  wire signed[`bits:0] j_in;  
  reg signed[`bits:0] j_out =  32'b00000000000000000000000000000000;
  
  always @ (posedge clk) begin
    
    out = in;
    j_out = j_in*(-1);
  end
  
  
endmodule