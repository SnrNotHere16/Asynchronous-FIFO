/*
Tested for wclk 10ns, rclk 35ns 
Simple write (one write), remain idle for 10 cycles (wclk) 
/*******************EDA playground settings************************
Ran on EDA Playground: Tools&Simulators: Aldec Riviera Pro 2020.04
					   Run options: +access+r 
*******************************************************************
output 
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test my_test...
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 10: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	x
# KERNEL:  rinc 	x
# KERNEL:  wdata 	x
# KERNEL:  rdata 	x
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	0
# KERNEL:  rrst_n 	0
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 30: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	x
# KERNEL:  rinc 	x
# KERNEL:  wdata 	x
# KERNEL:  rdata 	x
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	0
# KERNEL:  rrst_n 	0
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 50: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	1
# KERNEL:  rinc 	0
# KERNEL:  wdata 	63
# KERNEL:  rdata 	x
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	1
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 70: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 90: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 110: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	1
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 130: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	1
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 150: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 170: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 190: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	1
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 210: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 230: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	1
# KERNEL:  wclk 	1
# KERNEL:  rclk 	0
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/my_scoreboard.svh(15) @ 250: uvm_test_top.env.scoreboard [Monitor:Write] 
# KERNEL:  winc 	0
# KERNEL:  rinc 	0
# KERNEL:  wdata 	0
# KERNEL:  rdata 	63
# KERNEL:  wfull 	0
# KERNEL:  rempty 	0
# KERNEL:  wclk 	1
# KERNEL:  rclk 	1
# KERNEL:  wrst_n 	1
# KERNEL:  rrst_n 	1
# KERNEL: 
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_objection.svh(1271) @ 250: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 250: reporter [UVM/REPORT/SERVER] 
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :   16
# KERNEL: UVM_WARNING :    0
# KERNEL: UVM_ERROR :    0
# KERNEL: UVM_FATAL :    0
# KERNEL: ** Report counts by id
# KERNEL: [Monitor:Write]    13
# KERNEL: [RNTST]     1
# KERNEL: [TEST_DONE]     1
# KERNEL: [UVM/RELNOTES]     1
# KERNEL: 
# RUNTIME: Info: RUNTIME_0068 uvm_root.svh (521): $finish called.
# KERNEL: Time: 250 ns,  Iteration: 62,  Instance: /TestBenchTop,  Process: @INITIAL#79_3@.
# KERNEL: stopped at time: 250 ns
# VSIM: Simulation has finished. There are no more test vectors to simulate.
# VSIM: Simulation has finished.
Done
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
