`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module clkdiv(      clk,
                    reset,
                    tick
                    );
 input clk, reset; //clk has a 100Mhz frequency
 output tick;
 reg tick; //A postive signal sent every 40 nanoseconds
 reg [20:0] q;  // The value to be compared to 1666666.
 
////////////////////////////////////////
//  combonational logic block         //
////////////////////////////////////////
 always @(*) 
 tick = (q == 1666666);
 
////////////////////////////////////////
//  sequential logic block            //
////////////////////////////////////////
 always @(posedge clk, posedge reset) begin 
    if (reset) q <= 21'b0;
    else q <= q+1;

 end 
endmodule