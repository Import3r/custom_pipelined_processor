module forwardMux3X1(in1,in2,in3,s,out);
input [31:0] in1 ,in2,in3;
input [1:0] s;
output reg [31:0]out;

always @(*)
begin 
case (s)
2'b00: out=in1;
2'b01: out=in2;
2'b10: out=in3;




endcase




end





endmodule 