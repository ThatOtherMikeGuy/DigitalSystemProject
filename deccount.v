// deccount.v
// Jerry Hamann
// EE 2390 Fall 2016
module deccount(cnt,nextdecen,en,up,clk,reset);
    output [3:0]    cnt;
    output          nextdecen;
    input           en, up;
    input           clk, reset;

    reg    [3:0]    cnt, ncnt;

    always @(posedge clk) begin
        if(reset)
            cnt <= 4'b0000;
        else
            if(en)
                cnt <= ncnt;
            else
                cnt <= cnt;
    end

    always @(cnt, up) begin
        if(up)
            ncnt = (cnt==9) ? 0 : cnt+1;
        else
            ncnt = (cnt==0) ? 9 : cnt-1;
    end

    assign nextdecen = ((cnt==9) && up && en) || ((cnt==0) && !up && en);
endmodule
