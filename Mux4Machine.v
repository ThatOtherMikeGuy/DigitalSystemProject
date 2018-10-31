// Mux4Machine.v
// State machine to drive multiplexed four-bit values for display
// on Digilent BASYS2 and BASYS3 seven segment displays.  Assumes
// a high speed input clock, uses internal counter to time-multiplex
// the display excitations.
//
// Inputs
// A=>MSD .... D=>LSD
// blank[3:0] ... If bit is a 1, that digit will be blank.
// 
module Mux4Machine(dp, muxd,adrive,A,B,C,D,clk,blank);
    output [3:0] muxd; // The multiplexed output selected from A,B,C,D
    output [3:0] adrive;  // Active low common anode drive of display
    output dp;
    input  [3:0] A,B,C,D,blank;
    input        clk;

    reg    [3:0] muxd, adrive, dp;
    parameter NUMSVAR=20;
    // Computation example for time-multiplexing:
    // With a 100 MHz clock (10 ns period), 2^NUMSVAR total clocks
    // will occur across one full display of a four digit value.
    // Ex. 10 n * 2^20 = 10 ns/tick * 1.048576E6 ticks = 10.48576 ms
    // That is, the whole display is updated about 10 times per second,
    // with each display receiving an input excitation for 2.62 ms out
    // of every 10.48 ms.
    reg    [NUMSVAR:1] nS, S; // Internal states to provide clk division

    always @(posedge clk)
        S <= nS;

    always @(S)
        nS = S + 1;

    always @(S[NUMSVAR:NUMSVAR-1] or A or B or C or D or blank)
    begin
            case(S[NUMSVAR:NUMSVAR-1])
                2'b11: begin muxd=A; adrive=(!blank[3] ? 4'b0111 : 4'b1111); dp=0; end
                2'b10: begin muxd=B; adrive=(!blank[2] ? 4'b1011 : 4'b1111); dp=1; end
                2'b01: begin muxd=C; adrive=(!blank[1] ? 4'b1101 : 4'b1111); dp=0; end
                2'b00: begin muxd=D; adrive=(!blank[0] ? 4'b1110 : 4'b1111); dp=1; end
                default: begin muxd=A; adrive=4'b1111; end
            endcase
    end
endmodule
