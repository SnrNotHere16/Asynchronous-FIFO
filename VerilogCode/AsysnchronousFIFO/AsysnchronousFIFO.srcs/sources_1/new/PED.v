`timescale 1ns / 1ps


module PED(clk, rst, in, ped  );
input clk, rst, in;
output ped;
reg q1, q2;

////////////////////////////////////////
//  continuous assignement for ped    //
////////////////////////////////////////
assign ped = q1 & ~q2;   
 
////////////////////////////////////////
//  sequential logic block            //
////////////////////////////////////////
always @(posedge clk, posedge rst)
    if (rst){q1,q2} <= 2'b00;
    else    {q1,q2} <= {in,q1};
endmodule
