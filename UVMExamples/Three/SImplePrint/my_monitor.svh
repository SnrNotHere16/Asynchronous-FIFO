class my_monitor extends uvm_monitor #(my_transaction); 
	`uvm_component_utils(my_monitor) 
	
	function new (string name = "my_monitor", uvm_component parent = null); 
		super.new(name, parent); 
	endclass: new 
	
	



endclass: my_monitor