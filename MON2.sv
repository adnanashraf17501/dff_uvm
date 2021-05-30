class dff_mon2 extends uvm_monitor;

`uvm_component_utils(dff_mon2)

dff_seq_item pkt1;

virtual intif inf;

uvm_analysis_port #(dff_seq_item)item_collected_port1;

function new(string name="mon2",uvm_component parent);
super.new(name,parent);
item_collected_port1=new("item_collected_port1",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual intif)::get(this,"","inf",inf);
endfunction

task run_phase(uvm_phase phase);
pkt1=dff_seq_item::type_id::create("pkt1");
forever
begin
#2;
@(posedge inf.clk);

pkt1.q=inf.q;
`uvm_info("MON2","MON2 TRANSACTIONS",UVM_NONE)
@(posedge inf.clk)
item_collected_port1.write(pkt1);

end
endtask
endclass
