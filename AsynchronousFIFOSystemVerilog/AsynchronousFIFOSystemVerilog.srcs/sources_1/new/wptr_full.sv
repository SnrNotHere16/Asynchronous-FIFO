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