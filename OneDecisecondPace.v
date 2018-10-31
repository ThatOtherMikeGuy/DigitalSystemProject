// OneDecisecondPace.v
// EE 2390 Fall2016
// Jerry C. Hamann Fall 2016
//
module OneDecisecondPace(decisecond,clk,reStart);
    output  decisecond;
    input   clk, reStart;

    // 100MHz/0.1Hz = 10^7; log_2(10^7) = 23.253...
    parameter   MAXCOUNT=(24'd10_000_000-1);
    reg [24:1]  countValue;

    always @(posedge clk)
        if(reStart)
            countValue <= MAXCOUNT;
        else
            countValue <= (countValue ? countValue-1 : MAXCOUNT);

    assign decisecond = !countValue;
endmodule
