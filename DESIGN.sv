module df(input clk,rst,d,output reg q);
always@(posedge clk)
begin
if(rst==0)
begin
q<=1'b0;
end
else
begin
q<=d;
end
end
endmodule
