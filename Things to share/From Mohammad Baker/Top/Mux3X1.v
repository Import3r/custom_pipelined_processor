module Mux3X1(in1,in2,in3,s1,s0,out);

input [31:0] in1,in2,in3;
input s1,s0;

output reg [31:0]out;
reg [1:0] sel;
//s1 is the least 
//s0 is the most




always @(*)
begin 
sel<={s0,s1};

case (sel)
2'b00: out<=in1;
2'b01: out<=in2;
2'b10: out<=in3;

endcase

end


endmodule 