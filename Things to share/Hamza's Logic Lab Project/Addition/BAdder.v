module BAdder(op1,op2,c0,result,status,C_last);
input [7:0] op1,op2;
input c0;
output [7:0] result;
output reg [3:0] status;
output reg C_last;
wire c1,c2,c3,c4,c5,c6,c7,co,z_flag;

fullAdder f1(op1[0],op2[0],c0,result[0],c1);
fullAdder f2(op1[1],op2[1],c1,result[1],c2);
fullAdder f3(op1[2],op2[2],c2,result[2],c3);
fullAdder f4(op1[3],op2[3],c3,result[3],c4);
fullAdder f5(op1[4],op2[4],c4,result[4],c5);
fullAdder f6(op1[5],op2[5],c5,result[5],c6);
fullAdder f7(op1[6],op2[6],c6,result[6],c7);
fullAdder f8(op1[7],op2[7],c7,result[7],co);

nor n1(z_flag,result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]);
always @* begin
status[3] = co;
C_last = c7;
status[2] = z_flag;
end
endmodule
