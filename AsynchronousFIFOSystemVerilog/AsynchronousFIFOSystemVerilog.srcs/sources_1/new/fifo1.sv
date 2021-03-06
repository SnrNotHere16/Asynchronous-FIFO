/*
File: fifo1.sv - FIFO top-level module 
	This is the top-level wrapper-module that includes all clock domains. The top module is only 
used as a wrapper to instantiate all of the other FPGA modules used in the design. If this FIFO is 
used as part of a larger ASIC or FPGA design, this top-level wrapper would probably be discarded
to permit grouping of the other FIFO modules into their respective clock domains for improved synthesis 
and static timing analysis. 

	The top-level FIFO module is a parameterized FIFO design with all sub-blocks instantiated using 
the recommended practice of doing named port connections. Another common coding practice is to give 
the top-level module instantiations the same name as the module name. This is done to facilitate
debug, since referencing module names in a hierarchial path will be straight forward if the instance
names match the module names. 

An interface was implemented for all the modules of the Asynchronous FIFO 
*/
//Inteface of the asynchronous FIFO, including the modports of all 
//its modules 
interface fifo1Inter #(parameter DSIZE = 8, parameter ASIZE = 4)
    ( output var logic [DSIZE-1:0] rdata, 
      output var logic wfull, rempty, 
      input wire logic [DSIZE-1:0] wdata,
      input wire logic wclken, winc, wclk, wrst_n, //winc = wclken
      input wire logic rinc, rclk, rrst_n);
	  
	  // directions: waddr - wptr_full -> fifomem, raddr - rptr_empty -> fifomem
	  logic [ASIZE-1: 0] waddr, raddr; 
	  // directions: wptr - wptr_full -> sync_w2r, rptr - rptr_empty -> sync_r2w
	  // directions: wq2_rptr - sync_r2w -> wptr_full, rq2_wptr - sync_w2r -> rptr_empty
	  logic [ASIZE: 0] wptr, rptr, wq2_rptr, rq2_wptr; 
	  
	  modport sync_r2w_mod(output wq2_rptr, input rptr, input wclk, wrst_n); 
	  
	  modport sync_w2r_mod(output rq2_wptr, input wptr, input rclk, rrst_n);
	  
	  modport fifomem_mod(output rdata, input wdata, input waddr, raddr, 
						  input wclken, output wfull, input wclk); 
						  
	  modport rptr_empty_mod(output rempty, 
						     output raddr, rptr, input rq2_wptr, 
							 input rinc, rclk, rrst_n); 
							 
	  modport wptr_full_mod(output wfull, 
							output waddr, wptr, input wq2_rptr,
							input winc, wclk, wrst_n); 


endinterface: fifo1Inter

module fifo1 #(parameter DSIZE = 8, 
			  parameter ASIZE = 4) 
	(
		output var logic [DSIZE-1:0] rdata, 
		output var logic wfull, 
		output var logic rempty, 
		input wire logic [DSIZE-1:0] wdata, 
		input wire logic winc, wclk, wrst_n, 
		input wire logic rinc, rclk, rrst_n 
	);
	
	
	fifo1Inter fifo1Interface (.rdata(rdata), .wfull(wfull), .rempty(rempty), 
							   .wdata(wdata), .wclken(winc), .winc(winc), .wclk(wclk), .wrst_n(wrst_n), 
							   .rinc(rinc), .rclk(rclk), .rrst_n(rrst_n)); 
	
	//read-domain to write-domain synchronizer 
	sync_r2w sync_r2w (.sync_r2w_mod(fifo1Interface.sync_r2w_mod));
	
	//Write-domain to read-domain synchronizer
	sync_w2r  sync_w2r (.sync_w2r_mod(fifo1Interface.sync_w2r_mod)); 
	
	//FIFO memory buffer 
	fifomem   fifomem(.fifomem_mod(fifo1Interface.fifomem_mod));
	
	//Read pointer & empty generation logic
	rptr_empty rptr_empty(.rptr_empty_mod(fifo1Interface.rptr_empty_mod)); 
	
	//Write pointer & full generation logic 
	wptr_full wptr_full (.wptr_full_mod(fifo1Interface.wptr_full_mod)); 

endmodule: fifo1 