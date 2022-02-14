class my_transaction extends uvm_sequence_item; 
	`uvm_object_utils(my_transaction) 
	 rand logic [7:0] wdata; 
	 rand logic winc; 
	 rand logic rinc; 
	 logic [7:0] rdata; 
	 logic wfull; 
	 logic rempty; 
	function new (string name = "");
		super.new(name); 
	endfunction: new 
endclass: my_transaction 


class read_sequence extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(read_sequence)
	
	function new (string name = ""); 
		super.new(name); 
	endfunction: new 

	task body;
		repeat (1) begin 
			req = my_transaction::type_id::create("req");
			start_item(req); 
			assert (req.randomize with {winc == 0; rinc == 1; wdata <= 255;});
			finish_item(req); 
		end 
	endtask: body 
endclass: read_sequence 

class full_write_sequence extends uvm_sequence#(my_transaction); 
	`uvm_object_utils(full_write_sequence) 
	
	function new (string name = ""); 
		super.new(name); 
	endfunction: new 

	task body; 
		repeat (17) begin
			req = my_transaction::type_id::create("req"); 
			start_item(req); 
			assert(req.randomize with {winc == 1; rinc == 0; wdata <= 255;})
			finish_item(req); 
		end
	endtask: body 

endclass: full_write_sequence

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

