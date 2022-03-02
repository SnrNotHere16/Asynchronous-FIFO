class my_monitor extends uvm_monitor; 
	`uvm_component_utils(my_monitor) 
	
	virtual dut_if dut_vif; 
	
	function new (string name = "my_monitor", uvm_component parent = null); 
		super.new(name, parent); 
	endfunction: new 
	
	function void build_phase (uvm_phase phase); 
		super.build_phase(phase); 
		if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vif", dut_vif)) begin 
			`uvm_error("", "uvm_config_db::get failed")
		end 
	endfunction: build_phase
	
	task run_phase (uvm_phase phase); 
		my_transaction item; 
		forever begin
			 @(dut_vif.wclk) begin 
				item = my_transaction::type_id::create("item"); 
				item.wdata = dut_vif.wdata; 
				item.winc = dut_vif.winc; 
				item.rinc = dut_vif.rinc; 
				item.rdata = dut_vif.rdata; 
				item.wfull = dut_vif.wfull; 
				item.rempty = dut_vif.rempty; 
				item.wclk = dut_vif.wclk; 
				item.wrst_n = dut_vif.wrst_n; 
				item.rclk = dut_vif.rclk; 
				item.rrst_n = dut_vif.rrst_n; 
			end 
			`uvm_info("Monitor", "Monitor transfer", UVM_LOW) 
			//write 
		end 
	endtask: run_phase 


endclass: my_monitor