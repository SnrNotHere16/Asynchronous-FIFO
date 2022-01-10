/*
File: fifomem.sv - FIFO memory buffer 
	This is the FIFO memory buffer that is accessed by both the read write and read clock domains. 
This buffer is most likely an instantiated, synchronous dual-port RAM. Other memory styles can 
be adapted to functions as the FIFO buffer. 

	The FIFO memory buffer is typically an instantiated ASIC or FPGA dual-port, synchronous memory
device. The memory buffer could also be synthesized to ASIC or FPGA registers using RTL code in
this module. 

About an instantiated vendor RAM versus a Verilog-declared RAM, the Synopsys DesignWare team did 
internal analysis and found that for sizes up to 256 bits, there is no lost area or performance 
using the Verilog-declared RAM compared to an instantiated vendor RAM. 

If a vendor RAM is instatiated, it is highly recommended that the instantiation be done using 
named port connections. 
*/
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