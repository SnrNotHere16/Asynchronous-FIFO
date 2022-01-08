interface fifo1Inter #(parameter DSIZE = 8, parameter ASIZE = 4)
    ( output var logic [DSIZE-1:0] rdata, 
      output var logic wfull, rempty, 
      input wire logic [DSIZE-1:0] wdata,
      input wire logic winc, wclk, wrst_n, 
      input wire logic rinc, rclk, rrst_n);
	  
	  logic [ASIZE-1: 0] waddr, raddr; 
	  logic [ASIZE: 0] wptr, rptr, wq2_rptr, rq2_wptr; 
	  
	  modport sync_r2w_mod(output wq2_rptr, input rptr, input wclk, wrst_n); 
	  modport sync_w2r_mod(); 
	  modport fifomem_mod(); 
	  modport rptr_empty_mod(); 
	  modport wptr_full_mod(); 


endinterface: fifo1Inter

module fifo1 #(parameter DSIZE = 8, 
			  parameter ASIZE = 4) 
	(
		output var logic [DSIZE-1:0] radata, 
		output var logic wfull, 
		output var logic rempty, 
		input wire logic [DSIZE-1:0] wdata, 
		input wire logic winc, wclk, wrst_n, 
		input wire logic rinc, rclk, rrst_n 
	);
	
	

	sync_r2w sync_r2w ();
	
	sync_w2r  sync_w2r (); 
	
	
	fifomem   fifomem();

	rptr_empty rptr_empty(); 
	
	wptr_full wptr_full (); 

endmodule: fifo1 