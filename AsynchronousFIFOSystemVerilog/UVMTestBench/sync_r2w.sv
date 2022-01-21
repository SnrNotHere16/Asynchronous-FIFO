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