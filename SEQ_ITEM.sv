class dff_seq_item extends uvm_sequence_item;
`uvm_object_utils(dff_seq_item)

rand bit d;
bit q;

function new(string name="dff_seq_item");
super.new(name);
endfunction

endclass
