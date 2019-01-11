module lrg(input clk, input inData, input j_inData, input bakwas, input j_bakwas, output outData, output j_outData);
  
  

  
  ///////////////////////////////////////////////
  
  
  //interfacing signals
  wire clk;
  reg rst=0;
  wire signed [`bits:0] inData;
  wire signed [`bits:0] j_inData;
  reg signed [`bits:0] outData;
  reg signed [`bits:0] j_outData;
 // wire signed [`bits:0] bakwass;
  wire signed [`bits:0] bakwas;
  wire signed [`bits:0] j_bakwas;
  
  
  //useful signals
  reg reset;
  reg k;
  
  //internal wires
  reg signed [`bits:0] a_j,j_i,i_h,g_f,f_b,h_b,b_a,c_d,e_d,d_l;
  reg signed [`bits:0] a_j_j,j_i_j,i_h_j,g_f_j,f_b_j,h_b_j,b_a_j,c_d_j,e_d_j,d_l_j;
  

 

  
 
/*
  always@(posedge clk)
    begin
      
      #1
      $display($time," input:\t\t in =\t %d+j%d",(inData)/1000000,(j_inData)/1000000);
      
      
      
      $display($time," input:\t\t bakwas =%d+j%d",(bakwas)/1000000,(j_bakwas)/1000000);
      $display($time," adder to delay:\t b_a =\t %d+j%d",(b_a)/1000000,(b_a_j)/1000000);
      $display($time," delay to addy:\t a_j =\t %d+j%d",(a_j)/1000000,(a_j_j)/1000000);
      $display($time," adder to trig:\t j_i =\t %d+j%d",(j_i)/1000000,(j_i_j)/1000000);
      $display($time," trig to two:\t i_h =\t %d+j%d",(i_h)/1000000,(i_h_j)/1000000);
      $display($time," two to adder:\t h_b =\t %d+j%d",(h_b)/1000000,(h_b_j)/1000000);
      $display($time," delay to adder:\t f_b =\t %d+j%d",(f_b)/1000000,(f_b_j)/1000000);
      
      
      $display($time," neg to delay:\t g_f =\t %d+j%d",(g_f)/1000000,(g_f_j)/1000000);
      
      $display($time," adder to adder:\t c_d =\t %d+j%d",(c_d)/1000000,(c_d_j)/1000000);
      $display($time," trig to adder:\t e_d =\t %d+j%d",(e_d)/1000000,(e_d_j)/1000000);
      $display($time," adder to acc:\t d_l =\t %d+j%d",(d_l)/1000000,(d_l_j)/1000000);
      
      $display($time," output:\t\t out =\t %d+j%d",(outData)/1000000,(j_outData/1000000));
      $display("   ");
    end
  
  */
  
  
  ///////////////////////////////////////////////
  
  
  
  
  //module addr(input clk, input a, input j_a, input b, input j_b, output s, output j_s);
  
  addr j (rst,clk,inData,j_inData,a_j,a_j_j,j_i,j_i_j);
  addr b (rst,clk,f_b,f_b_j,h_b,h_b_j,b_a,b_a_j);
  addr c (rst,clk,i_h,i_h_j,f_b,f_b_j,c_d,c_d_j);
  addr d (rst,clk,e_d,e_d_j,c_d,c_d_j,outData,j_outData);
  
  
  
  //module delay(input clk, input inData, input j_inData, output outData, output j_outData);
  delay a(rst,clk,b_a,b_a_j,a_j,a_j_j);
  delay f(rst,clk,g_f,g_f_j,f_b,f_b_j);
  
  
  //module tw(input in, input j_in, output out, output j_out);
  tw h(rst,i_h,clk,i_h_j,h_b,h_b_j);
  

  //module neg(input clk, input in, input j_in, output out, output j_out);
  neg g(rst,clk,j_i,j_i_j,g_f,g_f_j);
  
  
 

  
  reg signed[`bits*2:0] ctemp = 1000000;
  reg signed[`bits*2:0] stemp = 0;
  
  
  initial begin
    assign i_h_j = (j_i_j*ctemp)/1000000;
    assign i_h = (j_i*ctemp)/1000000;
    assign e_d = -(j_i_j*stemp)/1000000;
    assign e_d_j = (j_i*stemp)/1000000;
  end



  
  
  
  always @ (posedge clk)
    begin
      repeat(53)
        begin
          @(posedge clk);
        end
      $display("sine chnaged");
      ctemp = ((ctemp*`cos)-(stemp*`sin))/1000000;
      stemp = ((stemp*`cos)+(ctemp*`sin))/1000000;
      $display("reset hua ",rst );
      rst=1;
      #1
      rst=0;
    end
  initial
    begin
      rst=1;
      #1
      rst=0;
       repeat(53)
        begin
          @(posedge clk);
        end
      ctemp=`cos;
      stemp=`sin;
    end
  
endmodule
