## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
## For BASYS3 with Vivado 2016.2, the following lines remove an implementation warning
	set_property CFGBVS VCCO [current_design]
	set_property CONFIG_VOLTAGE 3.3 [current_design] 


## Switches
set_property PACKAGE_PIN V17 [get_ports {countDown}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {countDown}]
set_property PACKAGE_PIN V16 [get_ports {reset}]					
        set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

	
	
## Seven Segment Display Segment Drives (active low, indexes a-0,...,g-6)
set_property PACKAGE_PIN W7 [get_ports {sevenSegmentsa2g[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[0]}]
set_property PACKAGE_PIN W6 [get_ports {sevenSegmentsa2g[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[1]}]
set_property PACKAGE_PIN U8 [get_ports {sevenSegmentsa2g[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[2]}]
set_property PACKAGE_PIN V8 [get_ports {sevenSegmentsa2g[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[3]}]
set_property PACKAGE_PIN U5 [get_ports {sevenSegmentsa2g[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[4]}]
set_property PACKAGE_PIN V5 [get_ports {sevenSegmentsa2g[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[5]}]
set_property PACKAGE_PIN U7 [get_ports {sevenSegmentsa2g[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sevenSegmentsa2g[6]}]

## Seven Segment Display Anode Drives (active low)
set_property PACKAGE_PIN U2 [get_ports {anodeDrives[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodeDrives[0]}]
set_property PACKAGE_PIN U4 [get_ports {anodeDrives[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodeDrives[1]}]
set_property PACKAGE_PIN V4 [get_ports {anodeDrives[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodeDrives[2]}]
set_property PACKAGE_PIN W4 [get_ports {anodeDrives[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anodeDrives[3]}]

## Seven Segment decimal tests
set_property PACKAGE_PIN V7 [get_ports {dp}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {dp}]
            
##Buttons
set_property PACKAGE_PIN U18 [get_ports {resetButton}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {resetButton}]
set_property PACKAGE_PIN W19 [get_ports {start}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {start}]
set_property PACKAGE_PIN T17 [get_ports {stop}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {stop}]
set_property PACKAGE_PIN T18 [get_ports {lapButton}]						
        set_property IOSTANDARD LVCMOS33 [get_ports {lapButton}]
        


