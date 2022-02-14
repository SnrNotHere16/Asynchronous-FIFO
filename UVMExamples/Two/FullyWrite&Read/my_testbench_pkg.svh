package  my_testbench_pkg;
	import uvm_pkg::*; 
	
	
  `include "my_sequence.svh"
  `include "my_driver.svh"

	
	
	class my_agent extends uvm_agent; 
		`uvm_component_utils(my_agent)
		my_driver driver; 
		uvm_sequencer#
		(my_transaction) sequencer;
		
		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction: new
		
		function void build_phase(uvm_phase phase); 
			driver = my_driver::type_id::create("driver", this); 
			sequencer =
        uvm_sequencer#(my_transaction)::type_id::create("sequencer", this);
		endfunction: build_phase 
		
		//In UVM connect phase, we connect the sequencer to the driver. 
      function void connect_phase (uvm_phase phase); 
			driver.seq_item_port.connect(sequencer.seq_item_export);
        	//      driver.seq_item_port.connect(sequencer.seq_item_export);

		endfunction: connect_phase
		
		task run_phase (uvm_phase phase); 
			//we raise the objection to keep the test from completing 
			phase.raise_objection(this); 
			begin 
				full_write_sequence wseq; 
				wseq = full_write_sequence::type_id::create("seq");
				wseq.start(sequencer); 
				
			end 
			//We drop objection to allow the test to complete
			phase.drop_objection(this); 
		
		endtask: run_phase 
	
	endclass: my_agent



	class my_env extends uvm_env; 
		`uvm_component_utils(my_env)
		my_agent agent; 
		
		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction: new
	
		function void build_phase(uvm_phase phase); 
			agent = my_agent::type_id::create("agent", this); 
		endfunction: build_phase
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
			//We raise objection to keep the test from completing 
			phase.raise_objection(this); 
			#10; 
			`uvm_warning("", "Hello World!")
			//We drop objection to allow the test to complete 
			phase.drop_objection(this); 
		endtask: run_phase
	endclass: my_test 


endpackage: my_testbench_pkg