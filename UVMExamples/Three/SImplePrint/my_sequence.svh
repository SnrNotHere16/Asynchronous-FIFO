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

           if (!req.randomize() with {rinc == 0; winc == 0; wdata <= 255;}) begin
           `uvm_error("Idle", "Randomize failed.");
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
		repeat (1) begin 
			start_item(req); 
			assert(req.randomize() with {rinc == 0; winc == 1; wdata <= 255;}); 
			finish_item(req);
		end 
	endtask: body 
endclass: single_write_seq

//Seqence to perfom full write on the FIFO 
class full_write_seq extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(my_seq2) 
	
	function new (string name = "full_write_seq"); 
		super.new(name); 
	endfunction: new 

	task body; 
		req = my_transaction::type_id::create("req"); 
		repeat (17) begin 
			start_item(req); 
			assert (req.randomize() with {}); 
			finish_item(req); 
		end 
	endtask: body

endclass: full_write_seq

//Sequence to perform a empty read on the FIFO
class empty_read_seq extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(my_seq3) 
	
	function new (string name = "empty_read_seq"); 
		super.new(name); 
	endfunction: new 
	
	task body; 
		req = my_transaction::type_id::create("req"); 
		start_item(req); 
		assert (req.randomize()with {rinc == 1; winc == 0; wdata <= 255;); 
		finish_item(req);
	
	endtask: body 
	
endclass: empty_read_seq