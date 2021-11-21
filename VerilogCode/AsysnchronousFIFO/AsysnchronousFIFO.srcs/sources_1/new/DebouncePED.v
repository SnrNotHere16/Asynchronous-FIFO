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


module DebouncePED (input clk, 
                    input reset, 
                    input inc,
                    output inc_i);
    wire inc_o; 
    Debounce write(.clk(clk), .reset(reset), .D_in(inc),.D_out(inc_o));
    PED write1 (.clk(clk), .rst(reset), .in(inc_o), .ped(inc_i)  );
endmodule
