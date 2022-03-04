class my_transaction  extends uvm_sequence_item;
	`uvm_object_utils(my_transaction) 
	parameter DSIZE = 8;
	//inputs 
		rand logic [DSIZE-1:0] wdata; 
		rand logic winc; 
		rand logic rinc; 
	//outputs 
		logic [DSIZE-1:0] rdata; 
		logic wfull; 
		logic rempty; 
		logic wclk, wrst_n; 
		logic rclk, rrst_n; 
		
	function new (string name = "");
		super.new(name); 
	endfunction: new 
	
	function string convert2string(); 
		string s; 
		s = super.convert2string(); 
		$sformat(s, "%s\n winc \t%0d\n rinc \t%0d\n wdata \t%0d\n rdata \t%0d\n wfull \t%0d\n rfull \t%0d\n", 
				 s, winc, rinc, wdata, rdata, wfull, rempty); 
		$sformat (s, "%s wclk \t%0b\n rclk \t%0b\n wrst_n \t%0b\n rrst_n \t%0b\n", s, wclk, rclk, wrst_n, rrst_n); 
		return s; 
	endfunction: convert2string
	
	function void do_print (uvm_printer printer); 
		$display(convert2string()); 
	endfunction: do_print 
	
endclass: my_transaction 

//Sequence to do nothing, remain idle, no write, no read
class idle_seq extends uvm_sequence #(my_transaction);
  	`uvm_object_utils(idle_seq)
	
	function new (string name = ""); 
		super.new(name); 
	endfunction: new 

	task body; 
		repeat(10) begin
			req = my_transaction::type_id::create("req");
            start_item(req);

           if (!req.randomize() with {rinc == 0; winc == 0; wdata == 0;}) begin
           `uvm_error("Idle", "Randomize failed.");
           end
		   
		    finish_item(req);
	end 
	endtask: body 
endclass: idle_seq

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
			assert(req.randomize() with {rinc == 0; winc == 1;wdata <= 255;}); 
			finish_item(req);
		end 
	endtask: body 
endclass: single_write_seq

//Seqence to perfom full write on the FIFO 
class full_write_seq extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(full_write_seq) 
	
	function new (string name = "full_write_seq"); 
		super.new(name); 
	endfunction: new 

	task body; 
		req = my_transaction::type_id::create("req"); 
		repeat (17) begin 
			start_item(req); 
			assert (req.randomize() with {rinc == 0; winc == 1; wdata <= 255;}); 
			finish_item(req); 
		end 
	endtask: body

endclass: full_write_seq

//Sequence to perform a empty read on the FIFO
class empty_read_seq extends uvm_sequence #(my_transaction); 
	`uvm_object_utils(empty_read_seq) 
	
	function new (string name = "empty_read_seq"); 
		super.new(name); 
	endfunction: new 
	
	task body; 
		req = my_transaction::type_id::create("req"); 
		repeat (71) begin 
			start_item(req); 
			assert (req.randomize()with {rinc == 1; winc == 0; wdata <= 255;}); 
			finish_item(req);
		end 
	endtask: body 
	
endclass: empty_read_seq