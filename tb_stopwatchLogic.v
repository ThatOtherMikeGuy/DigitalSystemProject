// tb_stopwatchLogic.v
// Caleb Whitman
// EE 2390 Fall 2016

`timescale 1ns / 1ns
module tb_stopwatchLogic;
    wire 		tresetCount, tenable, tup;
    reg         tstart, tstop, tcountDown;
    reg         tclk, tresetButton;

    stopwatchLogic  dut(tresetCount, tenable, tup, tstart, tstop, tcountDown,tclk,tresetButton);

    always
        #10 tclk = !tclk;   // Creates a clock of period 20 ns

    initial begin           // Use multiples of 20 ns in every change
        $dumpfile("tb_stopwatchLogic.vcd");
        $dumpvars(0,tb_stopwatchLogic);     // Best to make inputs known at t=0
		
		//testing basic functionaliy
        tclk=0; tresetButton=0; tstart=0; tstop=0; tcountDown=0; #40  //0-40ns Initially unknown, but we will get into the STOPPED (0) state after 10 ns. Every single output should be 0.
		tstart=1; #20 tstart=0;									 #40  //40-100ns Switch and stay in COUNTING. enable should be 1. All other outputs should be 0.
		tstop=1; #20 tstop=0;									 #40  //100-160ns Switch and stay in STOPPED. All outputs should be 0.
		tresetButton=1; #20 tresetButton=0;						 #40  //160-220ns resetCount should become 1 for 20 ns and then become 0 again.
		tcountDown=1;											 #20  //220-240ns up should become 1 and stay 1 for the rest of the test
		
		//testing button mashing.
		tstart=1;												 #20 //240-260ns Switch and stay in COUNTING
		tstop=1;												 #20 //260-280ns nothing should happend since we are still mashing the start button.
		tresetButton=1;											 #20 //280-300ns now we are mashing all three buttons, nothing should happen.
		tstop=0; 												 #20 //300-320ns nothing should happen
		tstart=0; tstop=1; 										 #40 //320-360ns Switch to STOPPED and output resetCount.
		tstart=1;												 #20 //360-380ns Nothing should change
		tresetButton=0;											 #20 //380-400ns resetCount should go to zero.
		tstop=0;												 #40 //400-440ns switch to COUNTING
        $finish;                                
    end
endmodule