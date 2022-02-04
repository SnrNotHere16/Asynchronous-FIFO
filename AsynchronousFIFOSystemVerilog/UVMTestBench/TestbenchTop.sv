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
		//wclk = 0; 
		//rclk = 0; 
		fork 
			//forever #10ns wclk = ~wclk; 
			//forever #35ns rclk = ~rclk; 
		join
	end 
	

	initial begin 
		//run_test(); //name of the test class 
	end 

endmodule: TestBenchTop

/*******************************************
This is a basic UVM "Hello World" testbench.

Explanation of this testbench on YouTube:
https://www.youtube.com/watch?v=Qn6SvG-Kya0
*******************************************/

`include "uvm_macros.svh"
`include "my_testbench_pkg.svh"

// The top module that contains the DUT and interface.
// This module starts the test.
module top;
  import uvm_pkg::*;
  import my_testbench_pkg::*;
  
  // Instantiate the interface
  dut_if dut_if1();
  
  // Instantiate the DUT and connect it to the interface
  dut dut1(.dif(dut_if1));
  
  // Clock generator
  initial begin
    dut_if1.clock = 0;
    forever #5 dut_if1.clock = ~dut_if1.clock;
  end
  
  initial begin
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual dut_if)::set(null, "*", "dut_vif", dut_if1);
    // Start the test
    run_test("my_test");
  end
  
  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
