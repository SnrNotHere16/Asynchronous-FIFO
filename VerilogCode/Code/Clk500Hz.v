`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Clk500Hz(
    input clk,
    input reset,
    input [31:0] count, 
    output reg clk_out
    );
    integer i; 
    
   always @(posedge clk, posedge reset) begin 
        if (reset) begin 
            i <= 0; 
            clk_out <= 1'b0; 
        end 
        else begin 
            if (i == count)begin 
                clk_out <= 1'b1; 
                i <= 0; 
            end 
            
            else begin 
                clk_out <= 1'b0;
                i <= i+1; 
            end 
        end 
   
   end 
endmodule