class my_transaction extends uvm_sequence_item; 
	`uvm_object_utils(my_transaction) 
	 rand logic [7:0] wdata; 
	 rand logic winc; 
	 rand logic rinc; 
	
	function new (string name = "");
		super.new(name); 
	endfunction: new 
endclass: my_transaction 

//Sequence to do nothing, remain idle, no write, no read
class idle extends uvm_sequence #(my_transaction);
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
endclass: idle

//Sequence to perform a single write on the FIFO
class single_write_seq extends uvm_sequence#(my_transaction); 
	`uvm_object_utils(single_write_seq) 
	
	function new(string name = "sinlge_write_seq"); 
		super.new(name); 
	endfunction: new 
	
	task body; 
		req = my_transaction::type_id::create("req");
		start_item(req); 
		assert(req.randomize()); 
		finish_item(req); 
	endtask: body 
endclass: single_write_seq

class full_write_seq extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(my_seq2) 
	
	function new (string name = "full_write_seq"); 
		super.new(name); 
	endfunction: new 

	task body; 
		req = my_transaction::type_id::create("req"); 
		start_item(req); 
			assert (req.randomize()); 
		
		finish_item(req); 
	
	
	endtask: body

endclass: full_write_seq

class empty_read_seq extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(my_seq3) 
	
	function new (string name = "empty_read_seq"); 
		super.new(name); 
	endfunction: new 
	
	task body; 
		req = my_transaction::type_id::create("req"); 
		start_item(req); 
		assert (req.randomize()); 
		finish_item(req);
	
	endtask: body 
	
endclass: empty_read_seq