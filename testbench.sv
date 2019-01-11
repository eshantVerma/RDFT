`include "delay.v"
`include "addr.v"
`include "negative.v"
`include "two.v"
`include "53_v3.v"
`include "2point.v"
`include "rdft.v"
`include "idft.v"
`include "conj.v"




`define bitsize 64
`define bits (`bitsize-1)
`define clk 5
`define chash 2*`clk



module test();
  
  reg clk;
  reg[`bits:0] data1;
  reg[`bits:0] j_data1;
  reg[`bits:0] data2;
  reg[`bits:0] j_data2;
  
  reg[`bits:0] odata,temp;
  reg[`bits:0] j_odata,j_temp;
  
  reg k;
  reg reset;
  
  
  always
    #`clk clk = ~clk;
  

  //53pt rdft
  /*
  lrg l(clk,data1,j_data1,data2,j_data2,odata,j_odata);
 
  
  
  
  always
  begin
    repeat(54)
      begin
        @(posedge clk)
        data1 = data1 + 1000000;
        if(data1 >53000000)
         data1=0;
      end
  end
  
    
  
  */
  
  
  //2pt rdft
  
  
  /*tp t(clk,data1,j_data1,odata,j_odata);
  

  always
  begin
    repeat(1)
      begin
        @(posedge clk)
        j_data1=0;
        data1 = data1 + 1000000;
        if(data1 >2000000)
          data1 = 1000000;
      end
  end
    
    
    */
  
  
  
  //rdft
  /*
  always
    repeat(106) 
      begin
        begin
          repeat(107)
            begin
              @(posedge clk)
              data1 = data1 + 1000000;
              if(data1 >106000000)
                data1=0;
              // data1 = 1000000;
            end
        end
        
      end
  
  */
  
  
  
  
  
  
  
  
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      reset = 0;
      k = 0;
      clk = 1;
      data1 = 0;
      j_data1 = 0;
      data2 = 0;
      j_data2 = 0;
      #15
      data2 = 1000000;
      j_data2 = 0;
      #30
      data2 = 3000000;
      #3200
      
      
      $finish;
    end
  
  
 
  
  
  
endmodule