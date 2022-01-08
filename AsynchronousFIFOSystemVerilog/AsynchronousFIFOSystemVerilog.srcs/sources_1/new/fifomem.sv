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