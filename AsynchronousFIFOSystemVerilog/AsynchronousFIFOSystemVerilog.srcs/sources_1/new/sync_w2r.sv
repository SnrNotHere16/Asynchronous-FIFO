`timescale 1ns / 1ps

module sync_w2r #(parameter ADDRSIZE = 4)
				 (fifo1Inter sync_w2r_mod);
				 
				 logic [ADDRSIZE: 0] rq1_wptr; 
				 
				 always_ff @ (posedge sync_w2r_mod.rclk, posedge sync_w2r_mod.rrst_n) begin 
					if (!sync_w2r_mod.rrst_n) begin 
						{sync_w2r_mod.rq2_wptr, rq1_wptr} <= 0; 
					end 
					else begin 
						{sync_w2r_mod.rq2_wptr, rq1_wptr} <= {rq1_wptr, sync_w2r_mod.wptr};  
					end 
				 end 
endmodule: sync_w2r 
