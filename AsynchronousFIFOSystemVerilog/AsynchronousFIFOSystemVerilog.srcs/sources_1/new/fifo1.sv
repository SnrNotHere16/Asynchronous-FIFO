interface fifo1Inter #(parameter DSIZE = 8, parameter ASIZE = 4)
    ( output var logic [DSIZE-1:0] rdata, 
      output var logic wfull, rempty, 
      input wire logic [DSIZE-1:0] wdata,
      input wire logic wclken, winc, wclk, wrst_n, //winc = wclken
      input wire logic rinc, rclk, rrst_n);
	  
	  // waddr - wptr_full -> fifomem, raddr - rptr_empty -> fifomem
	  logic [ASIZE-1: 0] waddr, raddr; 
	  // wptr - wptr_full -> sync_w2r, rptr - rptr_empty -> sync_r2w
	  // wq2_rptr - sync_r2w -> wptr_full, rq2_wptr - sync_w2r -> rptr_empty
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
	
	sync_r2w sync_r2w ();
	
	sync_w2r  sync_w2r (); 
	
	
	fifomem   fifomem();

	rptr_empty rptr_empty(); 
	
	wptr_full wptr_full (); 

endmodule: fifo1 