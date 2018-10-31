module zeroTest(enable,mins,tens,ones,tenths,up,deciClk, clk);
    output enable;
    input [3:0] mins,tens,ones,tenths;
    input clk,up,deciClk;
    
    reg enable;
    
     always @(posedge clk)
     begin
     if(up)
         enable <= deciClk && ( (mins==9) && (tens==5) && (ones==9) && (tenths==9) );
     else
         enable <= deciClk && ( (mins==0) && (tens==0) && (ones==0) && (tenths==1));
     end


endmodule
