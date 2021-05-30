interface intif(input bit clk,rst);
logic d;
logic q;


modport dut(input clk,rst, d,output q);
endinterface


