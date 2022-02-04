class my_driver extends uvm_driver #(my_transaction); 
	`uvm_component_utils(my_driver)
	

	virtual dut_if dut_vif;
  
  function new (string name, uvm_component parent); 
	super.new(name, parent); 
  endfunction: new
  
  function void build_phase(uvm_phase phase); 
	//Get interface reference from config database 
	if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vif", dut_vif)) begin 
		`uvm_error("", "uvm_config_db::get failed")
	end
  endfunction: build_phase
  
  task run_phase (); 
	//First toggle reset 
	/*
	 dut_vif.reset = 1;
    @(posedge dut_vif.clock);
    #1;
    dut_vif.reset = 0;
	*/
	
	//Now drive normal traffc 
		forever begin 
			seq_item_port.get_next_item(req); 
			
			//Wiggle pins of DUT 
			/*
			dut_vif.cmd  = req.cmd;
		    dut_vif.addr = req.addr;
			dut_vif.data = req.data;
			@(posedge dut_vif.clock)
			*/
			seq_item_port.item_done(); 
		end 
  
  endtask: run_phase 

endclass: my_driver 