module MS(op1,op2,op3,result,status);
input [7:0] op1,op2,op3;
output [7:0] result;
output reg [3:0] status;
wire [7:0] multiTemp;
wire [3:0] Stemp;
multi m1(op2,op3,multiTemp);
sub s1(multiTemp,op1,result,Stemp);
always@* begin
status[2] = Stemp[2];
end
endmodule
