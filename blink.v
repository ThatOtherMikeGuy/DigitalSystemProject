
module blink(blinking,en,blink,reset,clk);
output [3:0] blinking;
input en,blink,reset,clk;

//deccount	counter(count,,en ,1'b1,clk,reset);
   // 100MHz/0.1Hz = 10^7; log_2(10^7) = 23.253...
 parameter   MAXCOUNT=(27'd100_000_000-1);
 reg [27:1]  countValue;

 always @(posedge clk)
     if(reset)
         countValue <= MAXCOUNT;
     else
         countValue <= (countValue ? countValue-1 : MAXCOUNT);



assign blinking = (blink && ((countValue<27'd50_000_000)) ? 4'b1111: 4'b0000);

endmodule
