// hexcount.v
// Caleb Whitman
// EE 2390 Fall 2016
//Counts from 0 to 6. 
module hexcount(cnt,cascade,en,up,clk,reset);
    output [3:0]    cnt;
    output          cascade;
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
            ncnt = (cnt==5) ? 0 : cnt+1;
        else
            ncnt = (cnt==0) ? 5 : cnt-1;
    end

    assign cascade = ((cnt==5) && up && en) || ((cnt==0) && !up && en);
endmodule