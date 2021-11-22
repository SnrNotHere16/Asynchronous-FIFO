`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 11:00:02 AM
// Design Name: 
// Module Name: Debounce
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


module Debounce(input clk, 
                input reset,
                input D_in, 
                input [31:0] count,  
                output D_out);
                wire clk_out; 
    
    Clk500Hz zero( .clk(clk),.reset(reset), .count(count), .clk_out(clk_out));
    OneShot one (.D_in(D_in), .clk_in(clk_out), .reset(reset), .D_out(D_out) );
endmodule
