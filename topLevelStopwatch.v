// topLevelStopwatch.v
// Caleb Whitman
// EE 2390 Fall 2016
//iverilog deccount.v hexcount.v stopwatchLogic.v stopwatchCount.v OneDecisecondPace.v Mux4Machine.v Hex27Seg.v topLevelStopwatch.v

module TopLevelstopwatch(dp, sevenSegmentsa2g,anodeDrives,start, stop, countDown, clk, resetButton,lapButton, reset);
    output [0:6]    sevenSegmentsa2g;
    output [3:0]    anodeDrives;  
    output dp;
    input           start, stop, countDown, clk, resetButton, reset,lapButton;
    
    wire   [3:0]    minute,tenSecond,oneSecond,tenthSecond, muxd, blinking;
    wire            enableCounter, up, resetCount, resetDeciClock, decisecond,cascade, blinkEnable,flashing;
    wire   [3:0]         omin, otenSec, osec, otenthSec;
    
    stopwatchCount     	stwc(minute,tenSecond,oneSecond,tenthSecond,cascade,enableCounter,decisecond,up,clk,resetCount ||reset);
	stopwatchLogic		stwl(blinkEnable,resetCount, enableCounter,up,start, stop, countDown,clk,resetButton, reset, flashing);
    Mux4Machine     	mux4(dp, muxd,anodeDrives,omin, otenSec, osec, otenthSec,clk,blinking);
    Hex27Seg        	hx27(sevenSegmentsa2g,muxd);
    OneDecisecondPace   ones(decisecond,clk,resetCount || reset);
    blink               blinker(blinking,1'b1,blinkEnable,reset,clk);
   zeroTest            zero(flashing,minute,tenSecond,oneSecond,tenthSecond,up,decisecond ,clk);
   lap                 lapDisplay(omin, otenSec, osec, otenthSec, minute,tenSecond,oneSecond,tenthSecond,lapButton,start,stop,clk,reset);
    

endmodule
