package  my_testbench_pkg;
	import uvm_pkg::*; 
	
  `include "my_sequence.svh"
  `include "my_driver.svh"
  `include "my_monitor.svh" 
  `include "my_scoreboard.svh"

	class my_agent extends uvm_agent; 
		`uvm_component_utils(my_agent)
		my_driver driver; 
		my_monitor monitor; 
		uvm_sequencer#
		(my_transaction) sequencer;
		
		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction: new
		
		function void build_phase(uvm_phase phase); 
			driver = my_driver::type_id::create("driver", this); 
			monitor = my_monitor::type_id::create("monitor", this); 
			sequencer =
			uvm_sequencer#(my_transaction)::type_id::create("sequencer", this);
		endfunction: build_phase 
		
		//In UVM connect phase, we connect the sequencer to the driver. 
		function void connect_phase (uvm_phase phase); 
			driver.seq_item_port.connect(sequencer.seq_item_export);
		endfunction: connect_phase
		
	endclass: my_agent

	class my_env extends uvm_env; 
		`uvm_component_utils(my_env)
		my_agent agent; 
		my_scoreboard scoreboard; 
		
		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction: new
	
		function void build_phase(uvm_phase phase); 
			agent = my_agent::type_id::create("agent", this); 
			scoreboard = my_scoreboard::type_id::create("scoreboard", this); 
		endfunction: build_phase
		
		function void connect_phase (uvm_phase phase); 
			super.connect_phase(phase); 
			agent.monitor.m_analysis_port.connect(scoreboard.m_analysis_imp);
		endfunction: connect_phase 
	endclass: my_env

	class my_test extends uvm_test; 
		`uvm_component_utils(my_test)
		my_env env; 
		
		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction: new
		
		function void build_phase(uvm_phase phase); 
			env = my_env::type_id::create("env", this); 
		endfunction: build_phase 
		
		task run_phase(uvm_phase phase); 
			//for some reason the order here matters 
			//the handles should be initialized first
			//then call onto the factory 
			reset_seq seq0; 
          	full_write_seq seq1; 
		    empty_read_seq seq2; 
			idle_seq seq3;  
			seq0 = reset_seq::type_id::create("seq0");
          	seq1 = full_write_seq::type_id::create("seq1");
			seq2 = empty_read_seq::type_id::create("seq2");  
			seq3 = idle_seq::type_id::create("seq3");
			//We raise objection to keep the test from completing 
			//start is a blocking assignment 
			phase.raise_objection(this); 
			seq0.start(env.agent.sequencer); 
			seq1.start(env.agent.sequencer); 
			seq2.start(env.agent.sequencer);
			seq3.start(env.agent.sequencer); 
			//env.scoreboard.outpu(); 
			//We drop objection to allow the test to complete 
			phase.drop_objection(this); 
		endtask: run_phase
	endclass: my_test 

endpackage: my_testbench_pkg
