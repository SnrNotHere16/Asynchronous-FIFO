class my_scoreboard extends uvm_scoreboard; 
	`uvm_component_utils(my_scoreboard) 
	
	uvm_analysis_imp #(my_transaction, my_scoreboard) m_analysis_imp; 
	my_transaction i; 
	
	covergroup my_transaction_c; 
		winc_cp: coverpoint i.winc; 
		rinc_cp: coverpoint i.rinc; 
	endgroup: my_transaction_c
	
	function new (string name = "my_scoreboard", uvm_component parent);  
		super.new(name, parent);
		my_transaction_c = new(); 
	endfunction: new 
	
	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		m_analysis_imp = new ("m_analysis_imp", this); 
	endfunction: build_phase
	

	function write (my_transaction item); 
		i = item; 
		my_transaction_c.sample(); 
		`uvm_info("Monitor:Write", item.convert2string(), UVM_LOW)
	endfunction: write 
	
endclass: my_scoreboard