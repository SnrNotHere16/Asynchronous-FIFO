`timescale 1ns / 1ps
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
