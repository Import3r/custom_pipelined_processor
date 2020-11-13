module sub(op1,op2,result,status);
input [7:0] op1,op2;
output [7:0] result;
output reg[3:0] status;
wire [7:0] twoOp2;
wire [3:0] Stemp;
wire c7,Overflow;
twoComp t1(op2,twoOp2);
BAdder b1(op1,twoOp2,0,result,Stemp,c7);
xor x1(Overflow,c7,Stemp[3]);//Overflow
always @* begin 
status[2] = Stemp[2];
status[0] = Overflow;
end
endmodule