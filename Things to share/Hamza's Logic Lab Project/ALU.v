module ALU(result,status,RS1,RS2,RS3,op);
input [3:0] op,RS1,RS2,RS3;
output reg [3:0] status;
output reg [7:0] result;
wire [7:0] op1,op2,op3;
wire temp;
wire [7:0] tempResult [8:0];
wire [3:0] tempStatus [6:0];
registers r1(RS1,RS2,RS3,op1,op2,op3);

oneComp o1(op1,tempResult[0]);
twoComp t1(op1,tempResult[1]);
BAdder b1(op1,op2,0,tempResult[2],tempStatus[0]);
sub s1(op1,op2,tempResult[3],tempStatus[1]);
multi m1(op1,op2,tempResult[4],tempStatus[2]);
MA m2(op1,op2,op3,tempResult[5],tempStatus[3]);
MS m3(op1,op2,op3,tempResult[6],tempStatus[4]);
x_or x1(op2,op3,tempResult[7],tempStatus[5]);
shiftRight s2(op1,tempResult[8]);
PG p1(result,tempStatus[6]);

always @* begin
//One’s complement 
if(op == 4'b0000) begin
	result = tempResult[0];
end
//Two’s complement  
else if(op == 4'b1010) begin
	result = tempResult[1];
end
//Addition 
else if(op == 4'b1011) begin
	result = tempResult[2];
	status = tempStatus[0];
end
//Subtraction 
else if(op == 4'b1100) begin
	result = tempResult[3];
	status = tempStatus[1];
end
//Multiplication 
else if(op == 4'b1101) begin
	result = tempResult[4];
	status = tempStatus[2];
end
//Multiplication and addition
else if(op == 4'b1110) begin
	result = tempResult[5];
	status = tempStatus[3];
end
//Multiplication and subtraction
else if(op == 4'b1111) begin
	result = tempResult[6];
	status = tempStatus[4];
end
//XOR
else if(op == 4'b0111) begin
	result = tempResult[7];
	status = tempStatus[5];
end
//Logical Shift Right for Op1
else if(op == 4'b1000) begin
	result = tempResult[8];
end
//Parity generation
else if(op == 4'b1001) begin
	status = tempStatus[6];
end
end
endmodule
