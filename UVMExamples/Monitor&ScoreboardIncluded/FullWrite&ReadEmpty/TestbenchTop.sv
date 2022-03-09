/*
Tested for wclk 10ns, rclk 35ns 
Simple write (one write), remain idle for 10 cycles (wclk) 
/*******************EDA playground settings************************
Ran on EDA Playground: Tools&Simulators: Aldec Riviera Pro 2020.04
					   Run options: +access+r 
*******************************************************************
output 
# UVM_INFO verilog_src/uvm-1.2/src/base/uvm_root.svh(392) @ 0: reporter [UVM/RELNOTES] 
# ----------------------------------------------------------------
# UVM-1.2
# (C) 2007-2014 Mentor Graphics Corporation
# (C) 2007-2014 Cadence Design Systems, Inc.
# (C) 2006-2014 Synopsys, Inc.
# (C) 2011-2013 Cypress Semiconductor Corp.
# (C) 2013-2014 NVIDIA Corporation
# ----------------------------------------------------------------
# 
#   ***********       IMPORTANT RELEASE NOTES         ************
# 
#   You are using a version of the UVM library that has been compiled
#   with `UVM_NO_DEPRECATED undefined.
#   See http://www.eda.org/svdb/view.php?id=3313 for more details.
# 
#   You are using a version of the UVM library that has been compiled
#   with `UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR undefined.
#   See http://www.eda.org/svdb/view.php?id=3770 for more details.
# 
#       (Specify +UVM_NO_RELNOTES to turn off this notice)
# 
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
#  wdata 	158
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
#  wdata 	158
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
#  wdata 	238
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
#  wdata 	223
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
#  rinc 	1
#  wdata 	24
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
#  rinc 	1
#  wdata 	78
#  rdata 	206
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 490: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	31
#  rdata 	206
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 510: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	189
#  rdata 	206
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 530: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	56
#  rdata 	62
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 550: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	11
#  rdata 	62
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 570: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	254
#  rdata 	62
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 590: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	36
#  rdata 	62
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 610: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	13
#  rdata 	104
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 630: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	81
#  rdata 	104
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 650: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	42
#  rdata 	104
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 670: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	20
#  rdata 	184
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 690: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	236
#  rdata 	184
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 710: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	40
#  rdata 	184
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 730: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	111
#  rdata 	184
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 750: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	223
#  rdata 	88
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 770: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	73
#  rdata 	88
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 790: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	4
#  rdata 	88
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 810: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	201
#  rdata 	225
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 830: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	254
#  rdata 	225
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 850: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	136
#  rdata 	225
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 870: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	194
#  rdata 	225
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 890: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	197
#  rdata 	134
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 910: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	12
#  rdata 	134
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 930: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	71
#  rdata 	134
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 950: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	230
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 970: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	125
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 990: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	19
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1010: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	65
#  rdata 	56
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1030: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	33
#  rdata 	249
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1050: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	41
#  rdata 	249
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1070: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	30
#  rdata 	249
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1090: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	83
#  rdata 	28
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1110: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	127
#  rdata 	28
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1130: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	132
#  rdata 	28
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1150: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	135
#  rdata 	28
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1170: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	65
#  rdata 	102
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1190: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	167
#  rdata 	102
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1210: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	247
#  rdata 	102
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1230: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	142
#  rdata 	10
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1250: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	213
#  rdata 	10
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1270: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	69
#  rdata 	10
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1290: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	69
#  rdata 	10
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1310: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	212
#  rdata 	209
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1330: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	188
#  rdata 	209
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1350: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	40
#  rdata 	209
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1370: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	138
#  rdata 	218
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1390: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	218
#  rdata 	218
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1410: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	120
#  rdata 	218
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1430: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	28
#  rdata 	218
#  wfull 	0
#  rempty 	0
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1450: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	154
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1470: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	245
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1490: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	117
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1510: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	114
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1530: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	52
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1550: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	12
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1570: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	80
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1590: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	252
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1610: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	134
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1630: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	33
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1650: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	33
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1670: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	1
#  wdata 	249
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1690: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1710: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1730: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1750: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1770: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1790: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1810: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1830: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1850: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	0
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO my_scoreboard.svh(30) @ 1870: uvm_test_top.env.scoreboard [Monitor:Write] 
#  winc 	0
#  rinc 	0
#  wdata 	0
#  rdata 	56
#  wfull 	0
#  rempty 	1
#  wclk 	1
#  rclk 	1
#  wrst_n 	1
#  rrst_n 	1
# 
# UVM_INFO verilog_src/uvm-1.2/src/base/uvm_objection.svh(1270) @ 1870: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO verilog_src/uvm-1.2/src/base/uvm_report_server.svh(847) @ 1870: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   99
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [Monitor:Write]    94
# [Questa UVM]     2
# [RNTST]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# 
# ** Note: $finish    : /usr/share/questa/questasim/linux_x86_64/../verilog_src/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 1870 ns  Iteration: 75  Instance: /TestBenchTop
# End time: 21:30:45 on Mar 08,2022, Elapsed time: 0:00:04
# Errors: 0, Warnings: 12
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
