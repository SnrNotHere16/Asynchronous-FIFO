`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// SevenSegmentDisplayController.sv
// The following module is the top module of the 
// seven segment display controller. 
//Note: to be used on the NEXYS4DDR 
//////////////////////////////////////////////////////////////////////////////////
interface SevSegDispConInter(input wire clk, reset, 
							 input wire logic [31:0] data, 
							 output var logic a, b , c, d, e, f, g,
							 output var logic [7:0] anode); 
	
	logic pxl_clk_out;
	//a nibble of input input data [31:0] 
	logic [2:0] seg_sel; 
	//nibble of data 
	logic [3:0] Y; 
	
	modport PixelClock_mod(input clk, reset, output pxl_clk_out, seg_sel ); 
	modport PixelController_mod(input pxl_clk_out, reset, output anode); 
	modport AdMux_mod(input seg_sel, data, output Y); 
	modport HexToSevenSeg_mod(input Y, output a, b, c, d, e, f, g); 

endinterface: SevSegDispConInter

module SevenSegmentDisplayController(input wire logic clk, reset,
									 input wire logic [31:0] data,
									 output var logic a, b, c, d, e, f,g, 
									 output var logic [7:0] anode);
									 
	//Interface instantiation 
	SevSegDispConInter SevSegDispConInterface(.*); 
	//Creates a clock pulse for pixel frequencey 
	PixelClock zero(.PixelClock_mod(SevSegDispConInterface.PixelClock_mod)); 
	//Selects which anode(0-7) to display 
	PixelController one(.PixelController_mod(SevSegDispConInterface.PixelController_mod)); 
	//Selects which nibble to display of the data sent
	Admux two(.AdMux_mod(SevSegDispConInterface.AdMux_mod)); 
	//Displays a nibble of data 
	HexToSevenSeg_mod(.HexToSevenSeg_mod(SevSegDispConInterface.HexToSevenSeg_mod)); 
	
	
	
endmodule: SevenSegmentDisplayController 
