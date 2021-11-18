/*
  Dual-clock asynchronous FIFO design and testbench in SystemVerilog
  Based on Cliff Cumming's Simulation and Synthesis Techniques for Asynchronous FIFO Design
  http://www.sunburst-design.com/papers/CummingsSNUG2002SJ_FIFO1.pdf

  Copyright (C) 2015 Jason Yu (http://www.verilogpro.com)

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


//
// Top level wrapper
//
module async_fifo1
#(
  parameter DSIZE = 8,
  parameter ASIZE = 4
 )
(
  input  logic winc, wclk, wrst_n,
  input  logic rinc, rclk, rrst_n,
  input  logic [DSIZE-1:0] wdata,

  output logic [DSIZE-1:0] rdata,
  output logic wfull,
  output logic rempty
);

  logic [ASIZE-1:0] waddr, raddr;
  logic [ASIZE:0] wptr, rptr, wq2_rptr, rq2_wptr;

  sync_r2w sync_r2w (.*);
  sync_w2r sync_w2r (.*);
  fifomem #(DSIZE, ASIZE) fifomem (.*);
  rptr_empty #(ASIZE) rptr_empty (.*);
  wptr_full #(ASIZE) wptr_full (.*);

endmodule


//
// FIFO memory
//
module fifomem
#(
  parameter DATASIZE = 8, // Memory data word width
  parameter ADDRSIZE = 4  // Number of mem address bits
)
(
  input  logic winc, wfull, wclk,
  input  logic [ADDRSIZE-1:0] waddr, raddr,
  input  logic [DATASIZE-1:0] wdata,
  output logic [DATASIZE-1:0] rdata
);

  // RTL Verilog memory model
  localparam DEPTH = 1<<ADDRSIZE;

  logic [DATASIZE-1:0] mem [0:DEPTH-1];

  assign rdata = mem[raddr];

  always_ff @(posedge wclk)
    if (winc && !wfull)
      mem[waddr] <= wdata;

endmodule


//
// Read pointer to write clock synchronizer
//
module sync_r2w
#(
  parameter ADDRSIZE = 4
)
(
  input  logic wclk, wrst_n,
  input  logic [ADDRSIZE:0] rptr,
  output logic [ADDRSIZE:0] wq2_rptr
);

  logic [ADDRSIZE:0] wq1_rptr;

  always_ff @(posedge wclk or negedge wrst_n)
    if (!wrst_n) {wq2_rptr,wq1_rptr} <= 0;
    else {wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};

endmodule


//
// Write pointer to read clock synchronizer
//
module sync_w2r
#(
  parameter ADDRSIZE = 4
)
(
  input  logic rclk, rrst_n,
  input  logic [ADDRSIZE:0] wptr,
  output logic [ADDRSIZE:0] rq2_wptr
);

  logic [ADDRSIZE:0] rq1_wptr;

  always_ff @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
      {rq2_wptr,rq1_wptr} <= 0;
    else
      {rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};

endmodule


//
// Read pointer and empty generation
//
module rptr_empty
#(
  parameter ADDRSIZE = 4
)
(
  input  logic rinc, rclk, rrst_n,
  input  logic [ADDRSIZE :0] rq2_wptr,
  output logic rempty,
  output logic [ADDRSIZE-1:0] raddr,
  output logic [ADDRSIZE :0] rptr
);

  logic [ADDRSIZE:0] rbin;
  logic [ADDRSIZE:0] rgraynext, rbinnext;

  //-------------------
  // GRAYSTYLE2 pointer
  //-------------------
  always_ff @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
      {rbin, rptr} <= '0;
    else
      {rbin, rptr} <= {rbinnext, rgraynext};

  // Memory read-address pointer (okay to use binary to address memory)
  assign raddr = rbin[ADDRSIZE-1:0];
  assign rbinnext = rbin + (rinc & ~rempty);
  assign rgraynext = (rbinnext>>1) ^ rbinnext;

  //---------------------------------------------------------------
  // FIFO empty when the next rptr == synchronized wptr or on reset
  //---------------------------------------------------------------
  assign rempty_val = (rgraynext == rq2_wptr);

  always_ff @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
      rempty <= 1'b1;
    else
      rempty <= rempty_val;

endmodule


//
// Write pointer and full generation
//
module wptr_full
#(
  parameter ADDRSIZE = 4
)
(
  input  logic winc, wclk, wrst_n,
  input  logic [ADDRSIZE :0] wq2_rptr,
  output logic wfull,
  output logic [ADDRSIZE-1:0] waddr,
  output logic [ADDRSIZE :0] wptr
);

  logic [ADDRSIZE:0] wbin;
  logic [ADDRSIZE:0] wgraynext, wbinnext;

  // GRAYSTYLE2 pointer
  always_ff @(posedge wclk or negedge wrst_n)
    if (!wrst_n)
      {wbin, wptr} <= '0;
    else
      {wbin, wptr} <= {wbinnext, wgraynext};

  // Memory write-address pointer (okay to use binary to address memory)
  assign waddr = wbin[ADDRSIZE-1:0];
  assign wbinnext = wbin + (winc & ~wfull);
  assign wgraynext = (wbinnext>>1) ^ wbinnext;

  //------------------------------------------------------------------
  // Simplified version of the three necessary full-tests:
  // assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
  // (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
  // (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
  //------------------------------------------------------------------
  assign wfull_val = (wgraynext=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]});

  always_ff @(posedge wclk or negedge wrst_n)
    if (!wrst_n)
      wfull <= 1'b0;
    else
      wfull <= wfull_val;

endmodule


//
// Testbench
//
module async_fifo1_tb;

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
  async_fifo1 #(DSIZE, ASIZE) dut (.*);

  initial begin
    wclk = 1'b0;
    rclk = 1'b0;

    fork
      forever #10ns wclk = ~wclk;
      forever #35ns rclk = ~rclk;
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
