module tp(input clk, input inData, input j_inData, output outData, output j_outData);
  
  
  reg signed[`bits:0] inData,j_inData;
  reg signed[`bits:0] bakwas,j_bakwas;
  reg signed[`bits:0] outData,j_outData;
  
  
  reg signed[`bits:0]inp,j_inp;
  
  reg clk;
  
  reg sel,rst;
  
  initial begin
    sel = 0;
    rst = 0;
  end
  
  
  reg signed[`bits:0] acc,j_acc;
  
  initial begin
    acc=0;
    j_acc=0;
    assign j_inp=j_inData;
    assign inp = inData;
  end
  
  
  
  
  
  
  
  
  
  always@(posedge clk)
    begin
      #0
      if(sel == 1'b1) begin
        acc= acc - inp;
        j_acc=j_acc-j_inp;
      end
      else begin
        acc=acc + inp;
        j_acc=j_acc+j_inp;
      end
      
      
    end
  /*
  always@(posedge clk)
    begin
      #0#0
      acc = acc + inp;
      
      $display($time," in=%d+j%d out=%d+j%d",inData,j_inData,acc,acc);
    end
  */
  always@(posedge clk)
    begin
      #0
      if(rst == 1'b1) begin
        #0#0#0acc = 0;
        j_acc=0;
        //$display($time," %d",acc);
      end
      
    end
 
  
  always @ (posedge clk)
    begin
      repeat(3)
        begin
          @(posedge clk);
        end
      //$display($time,"sel %b",sel);
      sel = 1;
      //$display($time,"sel %b",sel);
      #1
      sel = 0;
      //$display($time,"sel %b",sel);
    end
  
  
  always @ (posedge clk)
    begin
        begin
          @(posedge clk);
        end
      
      //$display($time,"rst %b",rst);
      rst = 1;
      //#0$display($time," in=%d+j%d out=%d+j%d",inData,j_inData,acc,j_acc);
      //$display($time,"rst %b",rst);
      #1
      rst = 0;
      //$display($time,"rst %b",rst);
    end
  
  
  
  
  
endmodule