class my_transaction extends uvm_sequence_item; 
	`uvm_object_utils(my_transaction) 
	 rand logic [7:0] wdata; 
	 rand logic winc; 
	 rand logic rinc; 
	
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

class my_seq2 extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(my_seq2) 
	
	function new (string name = ""); 
		super.new(); 
	endfunction: new 

	task body; 
		req = my_transaction::type_id::create("req"); 
		start_item(req); 
			assert (req.randomize()); 
		
		finish_item(req); 
	
	
	endtask: body

endclass: my_seq2