class my_transaction extends uvm_sequence_item; 
	`uvm_object_utils(my_transaction) 
	 rand logic [7:0] rdata; 
	 rand logic wfull; 
	 rand logic rempty; 
	 rand logic [7:0] wdata; 
	 rand logic winc, wclk, wrst_n; 
	 rand logic rinc, rclk, rrst_n; 
	
	function new (string name = "");
		super.new(name); 
	endfunction: new 
endclass: my_transaction 


class my_sequence extends uvm_sequence #(my_transaction);
	`uvm_object_utils(my_sequence)
	
	function new (string name = ""); 
		super.new(name); 
	endfunction: new 

	task body; 
		repeat(8) begin
			req = my_transaction::type_id::create("req");
            start_item(req);

           if (!req.randomize()) begin
           `uvm_error("MY_SEQUENCE", "Randomize failed.");
           end
		   
		    finish_item(req);
	end 
	endtask: body 
endclass: my_sequence

