 import uvm_pkg::*;
`include "uvm_macros.svh"
`include "INTERFACE.sv"
`include "DESIGN.sv"
`include "DUT.sv"
`include "SEQ_ITEM.sv"
`include "SEQ.sv"
`include  "SEQR.sv"
`include "DRV.sv"
`include "MON1.sv"
`include "MON2.sv"
`include "AGENT1.sv"
`include "AGENT2.sv"
`include "SB.sv"
`include "ENV.sv"
`include "TEST.sv"

module df_top();
bit rst;
bit clk;

initial
begin
clk=1'b0;
forever #5clk=~clk;
end

initial 
begin
rst=0;
#10
rst=1'b1;
end

intif inf(clk,rst);
DUT dut(inf);



initial
begin
uvm_config_db#(virtual intif)::set(uvm_root::get(),"*","inf",inf);
run_test("dff_test");
end
endmodule




