`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 

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
                           wire clk2;


    SevenSegmentDisplayController zero(clk, reset, rdata, 
                                      a, b, c, d, e, f, g, anode);
    clkdiv one (.clk(clk), .reset(reset), .tick(clk2));

    fifo1 two(.rdata(rdata), .wfull(wfull), .rempty(rempty),
              .wdata(wdata), .winc(winc), .wrst_n(wrst_n), .rinc(rinc), .rrst_n(rrst_n),
              .wclk(clk), .rclk(clk2));
endmodule
