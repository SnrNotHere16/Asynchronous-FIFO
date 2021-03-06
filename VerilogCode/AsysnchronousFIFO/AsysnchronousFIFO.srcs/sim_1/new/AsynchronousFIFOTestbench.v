`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 12:36:01 PM
// Design Name: 
// Module Name: AsynchronousFIFOTestbench
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


module AsynchronousFIFOTestbench();
        parameter DSIZE = 8;
        parameter ASIZE = 4;
        reg clk, reset; 
        reg winc, wrst_n; 
        reg rinc, rrst_n; 
        reg [7:0] wdata; 
        wire wfull, rempty; 
        wire a, b, c, d, e, f, g; 
        wire [7:0] anode; 
        
            
        AsynchronousFIFOTop  #(DSIZE, ASIZE) dut (.wfull(wfull), .rempty(rempty), 
                                 .a(a), .b(b), .c(c), .d(d), 
                                 .e(e), .f(f), .g(g), 
                                 .anode(anode), 
                                 .clk(clk), .reset(reset), 
                                 .wdata(wdata), 
                                 .winc(winc), .wrst_n(wrst_n), 
                                 .rinc(rinc), .rrst_n(rrst_n)); 
       
       always#5 clk = ~clk; 
       initial begin 
            clk = 0; winc = 0; wrst_n = 1; rinc = 0; rrst_n = 1; 
            reset = 0; wdata = 0; 
            repeat (5) @ (posedge clk); reset = 1; wrst_n = 0; rrst_n = 0; 
            repeat (5) @ (posedge clk); reset = 0; wrst_n = 1; rrst_n = 1; 
            repeat (16) @ (posedge clk) begin //Fill up the FIFO 
                repeat (200000) @ (posedge clk) begin winc = 0; end 
                repeat(2000000) @ (posedge clk) begin  
                    rinc = 0; 
                    winc = 1; 
                    wdata = $urandom; 
                end 
            end 
            repeat (18) @ (posedge clk) begin //Empty the FIFO 
                repeat (200000) @ (posedge clk) begin winc = 0; rinc = 0; end 
                repeat(2000000) @ (posedge clk) begin  
                    rinc = 1;  
                end 
           end 
          repeat (10) @ (posedge clk) rinc = 0; 
       $stop; 
       end 
    
endmodule
