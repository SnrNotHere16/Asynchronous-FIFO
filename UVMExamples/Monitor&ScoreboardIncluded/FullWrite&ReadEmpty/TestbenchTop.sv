/*
Tested for wclk 10ns, rclk 35ns 
Simple write (one write), remain idle for 10 cycles (wclk) 
/*******************EDA playground settings************************
Ran on EDA Playground: Tools&Simulators: Aldec Riviera Pro 2020.04
					   Run options: +access+r 
*******************************************************************
output 
# UVM_INFO verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(277) @ 0: reporter [Questa UVM] QUESTA_UVM-1.2.3
# UVM_INFO verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(278) @ 0: reporter [Questa UVM]  questa_uvm::init(+struct)
# UVM_INFO @ 0: reporter [RNTST] Running test my_test...
# UVM_INFO my_scoreboard.svh(30) @ 10: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	x
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	0
#  rrst_n 	0
# 
# UVM_INFO my_scoreboard.svh(30) @ 30: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	56
#  rdata 	x
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 50: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	246
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 70: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	206
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 90: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	62
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 110: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	104
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 130: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	184
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 150: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	88
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 170: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	225
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 190: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	134
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 210: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	56
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 230: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	249
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 250: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	28
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 270: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	102
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 290: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	10
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 310: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	209
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 330: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	218
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 350: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	1
#  rinc 	0
#  wdata 	144
#  rdata 	56
#  wfull 	1
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 370: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	0
#  rdata 	56
#  wfull 	1
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 390: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	0
#  rdata 	246
#  wfull 	1
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 410: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	0
#  rdata 	246
#  wfull 	1
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 430: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	0
#  rdata 	246
#  wfull 	1
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 450: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 470: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 490: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 510: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 530: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 550: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 570: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 590: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 610: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 630: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	246
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO verilog_src/uvm-1.2/src/base/uvm_objection.svh(1270) @ 630: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO verilog_src/uvm-1.2/src/base/uvm_report_server.svh(847) @ 630: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   37
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [Monitor:Write]    32
# [Questa UVM]     2
# [RNTST]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# 
# ** Note: $finish    : /usr/share/questa/questasim/linux_x86_64/../verilog_src/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 630 ns  Iteration: 75  Instance: /TestBenchTop
# End time: 21:16:43 on Mar 08,2022, Elapsed time: 0:00:04
# Errors: 0, Warnings: 12
Done
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
