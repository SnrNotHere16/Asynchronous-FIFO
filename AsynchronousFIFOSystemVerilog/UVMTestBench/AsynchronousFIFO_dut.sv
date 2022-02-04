module AsynchronousFIFO_dut(dut_if _if); 

/*
fifo1 #(parameter DSIZE = 8, 
			  parameter ASIZE = 4) 
	(
		output var logic [DSIZE-1:0] rdata, 
		output var logic wfull, 
		output var logic rempty, 
		input wire logic [DSIZE-1:0] wdata, 
		input wire logic winc, wclk, wrst_n, 
		input wire logic rinc, rclk, rrst_n 
		//....
	);
*/
fifo1 dut(
		.rdata(), 
		.wfull(), 
	    .rempty(), 
		.wdata(), 
		.winc(), .wclk(), .wrst_n(), 
		.rinc(), .rclk(), .rrst_n() 
	);
	
endmodule: AsynchronousFIFO_dut