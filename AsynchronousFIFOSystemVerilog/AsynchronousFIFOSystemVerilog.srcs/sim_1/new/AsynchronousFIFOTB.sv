`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Dual-clock asynchronous FIFO design and testbench in SystemVerilog
//  Based on Cliff Cumming's Simulation and Synthesis Techniques for Asynchronous FIFO Design
//  http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf
//  Copyright (C) 2015 Jason Yu (http://www.verilogpro.com)
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//////////////////////////////////////////////////////////////////////////////////


module AsynchronousFIFOTB();
parameter DSIZE = 8;
  parameter ASIZE = 4;

  logic [DSIZE-1:0] rdata;
  logic wfull;
  logic rempty;
  logic [DSIZE-1:0] wdata;
  logic winc, wclk, wrst_n;
  logic rinc, rclk, rrst_n;

  // Model a queue for checking data
  logic [DSIZE-1:0] verif_data_q[$];
  logic [DSIZE-1:0] verif_wdata;


  // Instantiate the FIFO
  fifo1 #(DSIZE, ASIZE) dut (.*);

  initial begin
    wclk = 1'b0;
    rclk = 1'b0;

    fork
      forever #10ns wclk = ~wclk;
      forever #20ns rclk = ~rclk;
    join
  end

  initial begin
    winc = 1'b0;
    wdata = '0;
    wrst_n = 1'b0;
    repeat(5) @(posedge wclk);
    wrst_n = 1'b1;

    for (int iter=0; iter<2; iter++) begin
      for (int i=0; i<32; i++) begin
        @(posedge wclk iff !wfull);
        winc = (i%2 == 0)? 1'b1 : 1'b0;
        if (winc) begin
          wdata = $urandom;
          verif_data_q.push_front(wdata);
        end
      end
      #1us;
    end
  end

  initial begin
    rinc = 1'b0;

    rrst_n = 1'b0;
    repeat(8) @(posedge rclk);
    rrst_n = 1'b1;

    for (int iter=0; iter<2; iter++) begin
      for (int i=0; i<32; i++) begin
        @(posedge rclk iff !rempty)
        rinc = (i%2 == 0)? 1'b1 : 1'b0;
        if (rinc) begin
          verif_wdata = verif_data_q.pop_back();
          // Check the rdata against modeled wdata
          $display("Checking rdata: expected wdata = %h, rdata = %h", verif_wdata, rdata);
          assert(rdata === verif_wdata) else $error("Checking failed: expected wdata = %h, rdata = %h", verif_wdata, rdata);
        end
      end
      #1us;
    end

    $finish;
  end
endmodule
