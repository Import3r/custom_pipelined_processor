module writeMux2X1( in1 ,in2,s,out);

input [31:0] in1 ;
input [63:0]in2;
input s;
output [63:0] out;

assign out= (s == 0) ? {32'h00000000,in1} :in2;





endmodule 