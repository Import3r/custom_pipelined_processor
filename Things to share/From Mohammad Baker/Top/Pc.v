module Pc(in , clk ,out,p,flush);
input [31:0] in ;
input clk;
input flush;
input [31:0] p;
output  reg [31:0] out;


always @(negedge clk )
begin 
if(~flush)
begin 
out =in;


end






end 
initial begin

#1 out =p;
//out =32'h0000;



end







endmodule 