module rdft(input clk, input in, input j_in, output out, output j_out);
  
  
  reg signed[`bits:0] in,j_in,out,j_out;
  reg clk,clock;
  reg signed[`bits:0] l_s,l_s_j;
  
  
  
  //module lrg(input clk, input inData, input j_inData/*, input bakwas, input j_bakwas*/, output outData, output j_outData,output clock);
  lrg l(clk,in,j_in,l_s,l_s_j,clock);
  
  //module tp(input clk, input inData, input j_inData, output outData, output j_outData);
  tp s(clock,l_s,l_s_j,out,j_out);
  
  
  
  
  
  
  
  
  
endmodule