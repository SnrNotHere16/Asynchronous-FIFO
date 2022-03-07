class my_scoreboard extends uvm_scoreboard; 
	`uvm_component_utils(my_scoreboard) 
	
	uvm_analysis_imp #(my_transaction, my_scoreboard) m_analysis_imp; 
	function new (string name = "my_scoreboard", uvm_component parent); 
		super.new(name, parent); 
	endfunction: new 
	
	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		m_analysis_imp = new ("m_analysis_imp", this); 
	endfunction: build_phase

	function write (my_transaction item); 
			`uvm_info("Monitor:Write", item.convert2string(), UVM_LOW)
	endfunction: write 


endclass: my_scoreboard