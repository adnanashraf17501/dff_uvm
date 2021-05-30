class dff_sb extends uvm_scoreboard;
`uvm_component_utils(dff_sb);

dff_seq_item pkt,pkt1;

uvm_tlm_analysis_fifo #(dff_seq_item)ip_fifo;
uvm_tlm_analysis_fifo #(dff_seq_item)op_fifo;

function new(string name="df_sb",uvm_component parent);
super.new(name,parent);
ip_fifo=new("ip_fifo",this);
op_fifo=new("op_fifo",this);

endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
pkt=dff_seq_item::type_id::create("pkt",this);
pkt1=dff_seq_item::type_id::create("pkt1",this);
endfunction


task run_phase(uvm_phase phase);
forever
begin

fork
ip_fifo.get(pkt);
`uvm_info("SB","TRANSACTIONS FROM MON1",UVM_NONE);
op_fifo.get(pkt1);
`uvm_info("SB","TRANSACTIONS FROM MON2",UVM_NONE);
join


if(pkt1.q==pkt.d)
   begin
`uvm_info("SB","DATA MATCHED",UVM_NONE);
//$display("SB:::::data matched pkt1.S=%d,pkt1.CR=%d,pkt.A=%d,pkt.B=%d,pkt.C=%d",pkt1.S,pkt1.CR,pkt.A,pkt.B,pkt.C);
   end

else

   begin
`uvm_info("SB","DATA NOT MATCHED",UVM_NONE);
 //$display("SB:::::data not matched pkt1.S=%d,pkt1.CR=%d,pkt.A=%d,pkt.B=%d,pkt.C=%d",pkt1.S,pkt1.CR,pkt.A,pkt.B,pkt.C);
    end 

end
endtask

endclass

