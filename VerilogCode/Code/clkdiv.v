`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//File: clkdiv.v 
//The following module is a clock divider module. 
//The module takes in a 100MHz signal and outputs a 25MHz signal. 
//////////////////////////////////////////////////////////////////////////////////


module clkdiv(      clk,
                    reset,
                    tick
                    );
 input clk, reset; //clk has a 100Mhz frequency
 output tick;
 reg tick; //A postive signal sent every 40 nanoseconds
 reg [3:0] q;  // The value to be compared to 1666666.
 
////////////////////////////////////////
//  combonational logic block         //
////////////////////////////////////////
 always @(*) 
 tick = (q == 3);
 
////////////////////////////////////////
//  sequential logic block            //
////////////////////////////////////////
 always @(posedge clk, posedge reset) begin 
    if (reset) q <= 4'b0;
    else begin
        if (tick) begin   
            q <= 4'b0;
        end
        
        else begin 
            q <=q+1;
        end  
    end 

 end 
endmodule