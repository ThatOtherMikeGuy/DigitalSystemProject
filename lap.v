
module lap(omin, otenSec, osec, otenthSec, min,tenSec,sec,tenthSec,lapButton,start,stop,clk,reset);
input [3:0] min,tenSec,sec,tenthSec;
input lapButton, reset, stop, start,clk;
output [3:0] omin,otenSec,osec,otenthSec;

reg S, nS;

parameter LAP =1'b0,NOTLAP=1'b1;

always @(posedge clk)
	begin
	if(reset)
	   S<=NOTLAP;
	  else
		S <= nS;

end   

always @(S, start, stop, lapButton)
case(S)
      LAP: nS = (start || stop) ? NOTLAP : LAP;
      NOTLAP: nS = lapButton ? LAP : NOTLAP;       
endcase
        
        
          

assign omin = (S==LAP) ? omin : min;
assign otenSec = (S==LAP) ? otenSec : tenSec;
assign osec = (S==LAP) ? osec : sec;
assign otenthSec=(S==LAP) ? otenthSec : tenthSec;

endmodule
