class my_scoreboard extends uvm_scoreboard; 
	`uvm_component(my_scoreboard) 
	
	function new (string name = "my_scoreboard", uvm_component parent); 
		super.new(name, parent); 
	endfunction: new 
	
	function void build_phase(uvm_phase phase); 
	
	endfunction: build_phase

	function write (my_transaction item); 
	
	
	
	endfunction: write 


endclass: my_scoreboard