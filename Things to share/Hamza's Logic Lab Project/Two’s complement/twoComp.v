module twoComp(op1,result);
input [7:0] op1;
output [7:0] result;
wire [7:0] tmp;
oneComp o1(op1,tmp);
BAdder b1(tmp,8'b00000001,0,result);
endmodule