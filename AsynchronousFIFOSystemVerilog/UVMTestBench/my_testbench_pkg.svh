package  my_testbench_pkg;
	import uvm_pkg::*; 
	
	
	`include "my_sequence.svh"
	`include "my_driver.shv" 
	
	
	class my_agent extends uvm_agent; 
		`uvm_component_utils(my_agent)
		my_driver driver; 
		uvm_sequencer#
		(my_transaction) sequencer;
		
		function new(string name, uvm_component parent);
			super.new(name, parent);
		endfunction: new 
	
	
	
	endclass: my_agent



	class my_env extends umv_env; 
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

	
	endclass: my_test 








endpackage: my_testbench_pkg