// stopwatchCount.v
// The top level counter for the lab final. Counts in a 0.00.0 format.
// EE 2390 Fall 2016
// Caleb Whitman

module stopwatchCount(minute,tenSecond,oneSecond,tenthSecond,cascade,enableFromCounter,enableFromClock,up,clk,reset);
	output [3:0] minute,tenSecond,oneSecond,tenthSecond;
	output cascade; 
	input up, enableFromCounter, enableFromClock, clk, reset;

	wire tenthToOne, oneToTen, tenToMin;
	
	deccount	tenthSec(tenthSecond,tenthToOne,enableFromCounter && enableFromClock,up,clk,reset);
	deccount	oneSec(oneSecond,oneToTen,tenthToOne,up,clk,reset);
	hexcount	tenSec(tenSecond,tenToMin,oneToTen,up,clk,reset);
	deccount	min(minute,cascade,tenToMin,up,clk,reset);
	
	
	
endmodule