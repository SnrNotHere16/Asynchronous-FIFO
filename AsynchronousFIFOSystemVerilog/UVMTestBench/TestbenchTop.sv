interface dut_if(); 
	logic clk0, clk1; 
	modport tb(); 
	modport dut(); 

endinterface: dut_if 

module TestBenchTop (); 

	//import uvm_pkg::*; 
	//import my_pkg::*;
	dut_if _if(); 
	AsynchronousFIFO_dut dut (.dut_inter(_if.dut));

	initial begin 
		//run_test(); //name of the test class 
	end 

endmodule: TestBenchTop