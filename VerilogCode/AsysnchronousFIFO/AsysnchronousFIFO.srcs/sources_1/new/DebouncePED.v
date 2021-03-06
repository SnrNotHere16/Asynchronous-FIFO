`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// File: DebouncePED.v 
// The following module incorporates a debounce module and 
// a PED (positive edge detection module). 
//Portlist: 
//  Input: 
//       clk - the clk for the debounce 
//       clkPED - the clk for the PED 
//       reset - the rest button 
//       inc - the input for the debounce to detect a button press 
//       count - this variable is used to determine the counter max value 
//               for the 500Hz clock. 
//  Output:
//        inc_i - the output of the PED for one clock cycle. 
//////////////////////////////////////////////////////////////////////////////////


module DebouncePED (input clk, 
                    input clkPED, 
                    input reset, 
                    input inc,
                    input [31:0]  count, 
                    output inc_i);
    
    wire inc_o; 
    Debounce write(.clk(clk), .reset(reset),.count(count), .D_in(inc),.D_out(inc_o));
    PED write1 (.clk(clk), .rst(reset), .in(inc_o), .ped(inc_i)  );
endmodule
