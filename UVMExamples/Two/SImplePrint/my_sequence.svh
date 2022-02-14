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

class my_write extends uvm_sequence_item; 
	`uvm_object_utils(my_write)
	 rand logic [7:0] wdata; 
	 rand logic winc; 
	 rand logic rinc; 
	 logic [7:0] rdata; 
	 logic wfull; 
	 logic rempty; 
	function new (string name = "");
		super.new(name); 
	endfunction: new 
	
	constraint write_con {winc == 1'b1; wdata <= 255;}
	constraint read_con {rinc == 1'b0;}

endclass: my_write


class my_sequence extends uvm_sequence #(my_write);
	`uvm_object_utils(my_sequence)
	
	function new (string name = ""); 
		super.new(name); 
	endfunction: new 

	task body; 
		repeat(8) begin
			req = my_write::type_id::create("req");
            start_item(req);

           if (!req.randomize()) begin
           `uvm_error("MY_SEQUENCE", "Randomize failed.");
           end
		   
		    finish_item(req);
	end 
	endtask: body 
endclass: my_sequence

