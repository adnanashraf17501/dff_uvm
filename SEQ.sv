class dff_seq extends uvm_sequence#(dff_seq_item);
`uvm_object_utils(dff_seq)

dff_seq_item pkt;

function new(string name="dff_seq");
super.new(name);
endfunction

task body();
pkt=dff_seq_item::type_id::create("pkt");
repeat(10)
begin
start_item(pkt);
if(!pkt.randomize())
begin
`uvm_fatal("SEQ", "SEQUENCE FAILED");
end
pkt.print();
finish_item(pkt);
`uvm_info("SEQ","SEQUENCE TRANSACTIONS",UVM_NONE);
end
endtask
endclass
