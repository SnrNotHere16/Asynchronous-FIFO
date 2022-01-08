interface fifo1_inter #(parameter DSIZE = 8, parameter ASIZE = 4)
    ( output var logic [DSIZE-1:0] rdata, 
      output var logic wfull, rempty, 
      input wire logic [DSIZE-1:0] wdata,
      input wire logic winc, wclk, wrst_n, 
      input wire logic rinc, rclk, rrst_n);


endinterface: fifo1_inter

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
	
	
	wire logic [ASIZE-1: 0] waddr, raddr; 
	wire logic [ASIZE: 0] wptr, rptr, wq2_rptr, rq2_wptr; 
//	sync_r2w sync_r2w ( .wq2_rptr(wq2_rptr),
//                    	.rptr(rptr),
//                    	.wclk(wclk),
//						.wrst_n(wrst_n)
//						 );
	sync_r2w sync_r2w ();
	
	sync_w2r  sync_w2r (); 
	
	
	fifomem   fifomem();

	rptr_empty rptr_empty(); 
	
	wptr_full wptr_full (); 

endmodule: fifo1 