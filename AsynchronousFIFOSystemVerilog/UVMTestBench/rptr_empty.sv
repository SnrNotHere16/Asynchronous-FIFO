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