`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// File: AsynchronousFIFOTop.v 
// The following module is the top module for the AsynchronousFIFO 
// The module includes a clock divier, seven segment display, 
// Debounce and PED module, and Cummings' Asynchronous FIFO. 
// This was made to be used on the NEXYS4DDR 
// The master clk is assumed to be 100Mhz 
//////////////////////////////////////////////////////////////////////////////////


module AsynchronousFIFOTop #(parameter DSIZE = 8, parameter ASIZE = 4)
                          (
                           output wfull,
                           output rempty,
                           output a,b,c,d,e,f,g,
                           output [7:0] anode,
                           input clk, reset, //master clk 100MHz
                           input [DSIZE-1:0] wdata,
                           input winc, wrst_n, //wclk
                           input rinc, rrst_n );//rclk
                           wire [DSIZE-1:0] rdata; 
                           wire rinc_i, winc_i; 
                           wire clk2; 
    localparam count100MHz = 199999; 
    localparam count25MHz =  49999; //2000000/4              
    DebouncePED write(.clk(clk),.clkPED(clk),  .reset(reset),.count(count100MHz), .inc(winc), .inc_i(winc_i));
    DebouncePED read(.clk(clk2), .clkPED(clk), .reset(reset), .count(count25MHz), .inc(rinc), .inc_i(rinc_i)); 
    SevenSegmentDisplayController zero(clk, reset, rdata, 
                                      a, b, c, d, e, f, g, anode);
    clkdiv one (.clk(clk), .reset(reset), .tick(clk2));

    fifo1 two(.rdata(rdata), .wfull(wfull), .rempty(rempty),
              .wdata(wdata), .winc(winc_i), .wrst_n(wrst_n), .rinc(rinc_i), .rrst_n(rrst_n),
              .wclk(clk), .rclk(clk2));
endmodule
