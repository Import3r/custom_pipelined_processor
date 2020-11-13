module BranchAdder(in1,in2,out);
input [31:0] in1 ,in2;

output  reg[31:0] out;
reg [31:0] in22;
always @(*)
begin 

if(in2[31]==1)
begin

in22=~in2 + 1;
out = in1-in22;



end
else 
out =in1 +in2;



end

endmodule 