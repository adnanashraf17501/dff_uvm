class dff_drv extends uvm_driver #(dff_seq_item);
`uvm_component_utils(dff_drv)
virtual intif inf;

function new(string name="dff_drv",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual intif)::get(this,"","inf",inf);
endfunction

 task run_phase(uvm_phase phase);
dff_seq_item pkt;
pkt=dff_seq_item::type_id::create("pkt");
forever
begin
seq_item_port.get_next_item(pkt);
@(negedge inf.clk);
inf.d=pkt.d;
@(negedge inf.clk);

seq_item_port.item_done();

`uvm_info("DRV","DRV TRANSACTION TO DUT",UVM_NONE);
#5;
end
endtask
endclass
