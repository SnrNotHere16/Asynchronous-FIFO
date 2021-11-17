`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 04:04:33 PM
// Design Name: 
// Module Name: AsynchronousFIFOTop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AsynchronousFIFOTop();
    
    fifo1 one();
    SevenSegmentDisplayController zero(clk, reset, 32'hFEDC_BA98, 
                                      a, b, c, d, e, f, g, anode);
endmodule
