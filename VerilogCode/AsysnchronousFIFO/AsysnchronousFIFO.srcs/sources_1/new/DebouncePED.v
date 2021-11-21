`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 02:06:57 PM
// Design Name: 
// Module Name: DebouncePED
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


module DebouncePED();
    Debounce write(.clk(clk), .reset(reset), .D_in(winc),.D_out(winc_o));
    PED write1 (.clk(clk), .rst(reset), .in(winc_o), .ped(winc_i)  );
endmodule
