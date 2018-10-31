// tb_stopWatchCount.v
// Caleb Whitman
// EE 2390 Fall 2016
`timescale 1ns / 1ns
module tb_stopWatchCount;
    wire [3:0]  tminute,ttenSecond,toneSecond,ttenthSecond;
    wire        tcascade;
    reg         tenable, tup;
    reg         tclk, treset;

    stopwatchCount  dut(tminute,ttenSecond,toneSecond,ttenthSecond,tcascade,tenable,tup,tclk,treset);

    always
        #10 tclk = !tclk;   // Creates a clock of period 20 ns

    initial begin           // Use multiples of 20 ns in every change
        $dumpfile("tb_stopWatchCount.vcd");
        $dumpvars(0,tb_stopWatchCount);     // Best to make inputs known at t=0
        tclk=0; treset=0; tenable=0; tup=0; #20     // All unknown outputs
        treset=1;                       #40     // Still unknown
        tenable=1;                          #60     // Finally reset to 0
        treset=0; tup=1;                #240    // Count 0.00.0 thru 0.01.2
        tup=0;                          #300    // Count 12 back thru 0 to 9.59.9
        tenable=0;                          #20     // Hang at 9.59.7
        tenable=1; tup=1;                   #100000    // Count 9.59.7 up to 8.19.7
        $finish;                                // Total simulation time 100680
    end
endmodule