interface dut_if(); 
	
	modport tb(); 
	modport dut(); 

endinterface: dut_if 

module TestBenchTop (); 

	dut_if _if(); 
	AsynchronousFIFO_dut dut (.dut_inter(_if.dut));

	initial begin 
		//run_test(); 
	end 

endmodule: TestBenchTop