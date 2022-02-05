/*
File: sync_r2w.sv - read-domain to write-domain synchronizer 
	This a synchronizer module that is used to synchronize the read pointer into the write-clock domain. 
 The synchronized read pointer will be used by the wptr_full module to generate the FIFO full condition. 
 This module only contains flip-flops that are synchronized to the real clock. No other logic is 
 included in this module. 
 
	This is a simple synchronizer module, used to pass an n-bit pointer from the read clock domain 
 to the write clock domain, through a pair of registers that are clocked by the FIFO write clock. 
 Notice the simplicity of the always block that concatenates the two registers together for reset 
 and shifting. The synchronizer always block is only three lines of code. 
 
 All module outputs are registerd for simplified synthesis using time budgeting. All outputs of 
 this module are entirely synchronous to the wclk and all asynchronous inputs to this module are 
 from the rclk domain with all signals named using an "r" prefix, making it easy to set a false path 
 on all "r*" signlas for simplified static timing analysis. 
*/
module sync_r2w #(parameter ADDRSIZE = 4)
				 (fifo1Inter sync_r2w_mod); 
				 
				 logic [ADDRSIZE: 0] wq1_rptr; 
				 
				 always_ff @(posedge sync_r2w_mod.wclk, negedge sync_r2w_mod.wrst_n) begin 
					if (!sync_r2w_mod.wrst_n) begin 
						{sync_r2w_mod.wq2_rptr, wq1_rptr} <= 0;
					end 
					else begin 
						{sync_r2w_mod.wq2_rptr, wq1_rptr} <= {wq1_rptr, sync_r2w_mod.rptr};
					end 
				 end 




endmodule: sync_r2w

/*
File: sync_w2r.sv - Write-domain to read-domain synchronizer
	This is a synchronizer module that is used to synchronize the read pointer into the write-clok
domain. The synchronized write pointer will be used by the rptr_empty module to generate the FIFO
empty condition. This module only contains flip-flops that are synthesized to the read clock. No 
other logic is included in this module. 

	This is a simple syncrhonizer module, used to pass an n-bit pointer from the write clock domain
to the read clock domain, through a pair of registers that are clocked by the FIFO read clock. 
Notice the simplicity of the always block that concatenates the two registers together for reset 
and shifting. The synchronizer always block is only three lines of code. 

All module outputs are registerd for simplified synthesis using time budgeting. All outputs of
this module are entirely synchronous to the rclk and all asynchronous inputs to this module are
from the wclk domain with all signals named using an "w" prefix, making it easy to set a false 
path on all "w*" signals for simplified staitc timing analysis. 
*/
module sync_w2r #(parameter ADDRSIZE = 4)
				 (fifo1Inter sync_w2r_mod);
				 
				 logic [ADDRSIZE: 0] rq1_wptr; 
				 
				 always_ff @ (posedge sync_w2r_mod.rclk, negedge sync_w2r_mod.rrst_n) begin 
					if (!sync_w2r_mod.rrst_n) begin 
						{sync_w2r_mod.rq2_wptr, rq1_wptr} <= 0; 
					end 
					else begin 
						{sync_w2r_mod.rq2_wptr, rq1_wptr} <= {rq1_wptr, sync_w2r_mod.wptr};  
					end 
				 end 
endmodule: sync_w2r 

/*
File: fifomem.sv - FIFO memory buffer 
	This is the FIFO memory buffer that is accessed by both the read write and read clock domains. 
This buffer is most likely an instantiated, synchronous dual-port RAM. Other memory styles can 
be adapted to functions as the FIFO buffer. 

	The FIFO memory buffer is typically an instantiated ASIC or FPGA dual-port, synchronous memory
device. The memory buffer could also be synthesized to ASIC or FPGA registers using RTL code in
this module. 

About an instantiated vendor RAM versus a Verilog-declared RAM, the Synopsys DesignWare team did 
internal analysis and found that for sizes up to 256 bits, there is no lost area or performance 
using the Verilog-declared RAM compared to an instantiated vendor RAM. 

If a vendor RAM is instatiated, it is highly recommended that the instantiation be done using 
named port connections. 
*/
module fifomem #(parameter DATASIZE = 8, 
				 parameter ADDRSIZE = 4)
				 (fifo1Inter fifomem_mod);
				 
				 localparam DEPTH = 1<<ADDRSIZE; 
				 logic [DATASIZE-1:0] mem [0:DEPTH-1]; 
				 
				 assign fifomem_mod.rdata = mem[fifomem_mod.raddr]; 
				 
				 always_ff @ (posedge fifomem_mod.wclk) begin 
					if (fifomem_mod.wclken && !fifomem_mod.wfull) begin 
						mem[fifomem_mod.waddr] <= fifomem_mod.wdata; 
					end 
				 
				 end 
				 
				 
				 
endmodule: fifomem

/*
File: rptr_empty.sv - Read pointer & empty generation logic
	This module is completely synchronous to the read-clock domain and contains the FIFO read pointer 
and empty-flag logic. 

	This module encloses all of the FIFO logic that is generated within the read clock domain (except 
synchronizers). The read pointer is a dual n-bit Gray code counter. The n-bit pointer(rptr) is passed 
to the write clock domain through the sync_r2w module. The (n-1)-bit pointer (raddr) is used to 
address the FIFO buffer. 

The FIFO empty output is registered and is asserted on the next rising rclk edge when the next rptr
value equals the synchronized wprt value. All module outputs are registerd for simplified synthesis
using time budgeting. This module is entirely synchronous to the rclk for simplified static timing 
analysis. 
*/
module rptr_empty #(parameter ADDRSIZE = 4) 
					(fifo1Inter rptr_empty_mod); 
					
					logic [ADDRSIZE: 0] rbin; 
					wire [ADDRSIZE: 0] rgraynext, rbinnext; 
					wire rempty_val; 
					
					//------------------
					//GRAYSTYLE2 pointer
					//------------------
					always_ff @ (posedge rptr_empty_mod.rclk, negedge rptr_empty_mod.rrst_n) begin 
						if (!rptr_empty_mod.rrst_n) begin 
							{rbin, rptr_empty_mod.rptr} <= 0; 
						end 
						else begin 
							{rbin, rptr_empty_mod.rptr} <= {rbinnext, rgraynext};
						end 
					end 
					
					// Memory read-address pointer (okay to use binary to address memory) 
					assign rptr_empty_mod.raddr = rbin[ADDRSIZE-1:0]; 
					
					assign rbinnext = rbin + (rptr_empty_mod.rinc & ~rptr_empty_mod.rempty); 
					assign rgraynext = (rbinnext>>1) ^ rbinnext; 
					
					//--------------------------------------------------------------
					//FIFO empty when the next rptr == synchronized wptr or on reset 
					//--------------------------------------------------------------
					assign rempty_val = (rgraynext == rptr_empty_mod.rq2_wptr); 
					
					always_ff @ (posedge rptr_empty_mod.rclk, negedge rptr_empty_mod.rrst_n) begin 
						if (!rptr_empty_mod.rrst_n) begin 
							rptr_empty_mod.rempty <= 1'b1;
						end 
						
						else begin
							rptr_empty_mod.rempty <= rempty_val;
						end 
					end 
					
endmodule: rptr_empty

/*
File: wptr_full.sv - Write pointer & full generation logic 
	This module is completely synchronous to the read-clock doamin and contains the FIFO read pointer 
and empty-flag logic. 

	This module encloses all of the FIFO logic that is generated within the write clock domain 
(except synchronizers). The write pointer is a dual n-bit Gray code counter. The n-bit pointer (wptr) 
is passed to the read clock domain through the sync_w2r module. The (n-1) bit-pointer (waddr) is used
to address the FIFO buffer. 

The FIFO full output is registered and is asserted on the next rising wclk edge when the next modified
wgnext value equals the synchronized and modified wrptr2 value (except MSBs). All module outputs are 
registered for simplified synthesis using time budgeting. This module is entirely synchronous to the 
wclk for simplified static timing analysis.  
*/
module wptr_full #(parameter ADDRSIZE = 4)
				 (fifo1Inter wptr_full_mod); 
				 
				 logic [ADDRSIZE: 0] wbin; 
				 wire [ADDRSIZE: 0] wgraynext, wbinnext, wfull_val; 
				 
				 //GRAYSTYLE2 pointer 
				 always_ff @ (posedge wptr_full_mod.wclk, negedge wptr_full_mod.wrst_n) begin 
					if (!wptr_full_mod.wrst_n) begin 
						{wbin, wptr_full_mod.wptr} <= 0; 
					end 
					
					else begin 
						{wbin, wptr_full_mod.wptr} <= {wbinnext, wgraynext};
					end 
				 end 
				 
				 //Memory write-address pointer (okay to use binary to address memory) 
				 assign wptr_full_mod.waddr = wbin[ADDRSIZE-1:0]; 
				 
				 assign wbinnext = wbin+ (wptr_full_mod.winc & ~wptr_full_mod.wfull);
				 assign wgraynext = (wbinnext>>1) ^ wbinnext; 
				 
				//------------------------------------------------------------------
				// Simplified version of the three necessary full-tests:
				// assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
				// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
				// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
				//------------------------------------------------------------------
				assign wfull_val = (wgraynext == {~wptr_full_mod.wq2_rptr[ADDRSIZE:ADDRSIZE-1],
												  wptr_full_mod.wq2_rptr[ADDRSIZE-2:0]});
												  
				always_ff @ (posedge wptr_full_mod.wclk, negedge wptr_full_mod.wrst_n) begin 
					if (!wptr_full_mod.wrst_n) begin 
						wptr_full_mod.wfull <= 1'b0; 
					end 
					
					else begin 
						wptr_full_mod.wfull <= wfull_val; 
					end 
				end 
endmodule: wptr_full
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
