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
        reg clk, reset; 
        reg winc, wrst_n; 
        reg rinc, rrst_n; 
        reg [7:0] wdata; 
        wire wfull, rempty; 
        wire a, b, c, d, e, f, g; 
        wire [7:0] anode; 
        
            
        AsynchronousFIFOTop dut (.wfull(wfull), .rempty(rempty), 
                                 .a(a), .b(b), .c(c), .d(d), 
                                 .e(e), .f(f), .g(g), 
                                 .anode(anode), 
                                 .clk(clk), .reset(reset), 
                                 .wdata(wdata), 
                                 .winc(winc), .wrst_n(wrst_n), 
                                 .rinc(rinc), .rrst_n(rrst_n)); 
       
       always#5 clk = ~clk; 
       initial begin 
            clk = 0; winc = 0; wrst_n = 0; rinc = 0; rrst_n = 0; 
            reset = 0; wdata = 0; 
            repeat (5) @ (posedge clk); reset = 1; wrst_n = 1; rrst_n = 1; 
            repeat (5) @ (posedge clk); reset = 0; wrst_n = 0; rrst_n = 0; 
            @(posedge clk) wdata = 0; @(posedge clk) winc = 1;  //write 1
            @(posedge clk) winc = 0;
            @(posedge clk) begin wdata = 1; end  //write 2 
            @(posedge clk) winc = 1; 
//            @(posedge clk) winc = 0;
//            @(posedge clk) begin wdata = 2; end  //write 3 
//            @(posedge clk) winc = 1; 
//            @(posedge clk) winc = 0;
//            @(posedge clk) begin wdata = 3; end  //write 4
//            @(posedge clk) winc = 1; 
//            @(posedge clk) winc = 0;
//            @(posedge clk) begin wdata = 4; end  //write 5
//            @(posedge clk) begin winc = 1; rinc = 1; end  
//            @(posedge clk) begin winc = 0; rinc = 0; end 
//            @(posedge clk) begin wdata = 5; end  //write 6 
//            @(posedge clk) begin winc = 1; rinc = 1; end  
//            @(posedge clk) begin winc = 0; rinc = 0; end 
//            @(posedge clk) begin wdata = 6; end  //write 7
//            @(posedge clk) begin winc = 1; rinc = 1; end  
//            @(posedge clk) begin winc = 0; rinc = 0; end 
//            @(posedge clk) begin wdata = 7; end  //write 8
//            @(posedge clk) begin winc = 1; rinc = 1; end  
//            @(posedge clk) begin winc = 0; rinc = 0; end 
       end 
    
    
endmodule
