/*
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test my_test...
# KERNEL: UVM_WARNING /home/runner/my_testbench_pkg.svh(79) @ 10: uvm_test_top [] Hello World!
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 10: reporter [FIFO] wdata =   x rdata =   x wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 30: reporter [FIFO] wdata =   x rdata =   x wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 50: reporter [FIFO] wdata = 121 rdata =   x wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 70: reporter [FIFO] wdata = 230 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 90: reporter [FIFO] wdata = 192 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 110: reporter [FIFO] wdata =   7 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 130: reporter [FIFO] wdata = 187 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 150: reporter [FIFO] wdata = 220 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 170: reporter [FIFO] wdata = 106 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 190: reporter [FIFO] wdata = 101 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 210: reporter [FIFO] wdata = 205 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 230: reporter [FIFO] wdata = 162 rdata = 121 wfull = 0 rempty = 1
# KERNEL: UVM_INFO /home/runner/design.sv(223) @ 250: reporter [FIFO] wdata = 228 rdata = 121 wfull = 0 rempty = 0
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_objection.svh(1271) @ 250: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 250: reporter [UVM/REPORT/SERVER] 
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :   16
# KERNEL: UVM_WARNING :    1
# KERNEL: UVM_ERROR :    0
# KERNEL: UVM_FATAL :    0
# KERNEL: ** Report counts by id
# KERNEL: []     1
# KERNEL: [FIFO]    13
# KERNEL: [RNTST]     1
# KERNEL: [TEST_DONE]     1
# KERNEL: [UVM/RELNOTES]     1
# KERNEL: 
# RUNTIME: Info: RUNTIME_0068 uvm_root.svh (521): $finish called.
# KERNEL: Time: 250 ns,  Iteration: 64,  Instance: /TestBenchTop,  Process: @INITIAL#42_3@.
# KERNEL: stopped at time: 250 ns
# VSIM: Simulation has finished. There are no more test vectors to simulate.
# VSIM: Simulation has finish
*/
interface dut_if  #(parameter DSIZE = 8, parameter ASIZE = 4) (); 

  logic [DSIZE-1:0] rdata; 
	logic wfull; 
	logic rempty; 
	logic [DSIZE-1:0] wdata; 
	logic winc, wclk, wrst_n; 
	logic rinc, rclk, rrst_n; 
	
endinterface: dut_if 

`include "uvm_macros.svh"
`include "my_testbench_pkg.svh"

module TestBenchTop (); 


	import uvm_pkg::*;
	import my_testbench_pkg::*;
	
	dut_if _if(); 
	fifo1 dut(
		.rdata(_if.rdata), 
		.wfull(_if.wfull), 
	    .rempty(_if.rempty), 
      	.wdata(_if.wdata), 
		.winc(_if.winc), .wclk(_if.wclk), .wrst_n(_if.wrst_n), 
		.rinc(_if.rinc), .rclk(_if.rclk), .rrst_n(_if.rrst_n) 
	);
	
	//clock generator 
	initial begin 
		_if.wclk = 0; 
		_if.rclk = 0; 
		fork 
			forever #10ns _if.wclk = ~_if.wclk; 
			forever #35ns _if.rclk = ~_if.rclk; 
		join
	end 
	

	initial begin 
		 // Place the interface into the UVM configuration database
		uvm_config_db#(virtual dut_if)::set(null, "*", "dut_vif", _if);
		run_test("my_test"); 
	end 
	
	initial begin 
		$dumpfile("dump.vcd");
      $dumpvars(0, TestBenchTop);
	end 

endmodule: TestBenchTop
  