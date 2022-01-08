module sync_r2w #(parameter ADDRSIZE = 4)
				 (fifo1Inter sync_r2w_mod); 
				 
				 logic [ADDRSIZE: 0] wq1_rptr; 
				 
				 always_ff @(posedge sync_r2w_mod.wclk, posedge sync_r2w_mod.wrst_n) begin 
					if (!sync_r2w_mod.wrst_n) begin 
						{sync_r2w_mod.wq2_rptr, wq1_rptr} <= 0;
					end 
					else begin 
						{sync_r2w_mod.wq2_rptr, wq1_rptr} <= {wq1_rptr, sync_r2w_mod.rptr};
					end 
				 end 




endmodule: sync_r2w