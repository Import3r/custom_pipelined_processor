module x_or(op2,op3,result,status);
input[7:0] op2,op3;
output [7:0] result;
output [3:0] status;
xor x1(result[0],op3[0],op2[0]);
xor x2(result[1],op3[1],op2[1]);
xor x3(result[2],op3[2],op2[2]);
xor x4(result[3],op3[3],op2[3]);
xor x5(result[4],op3[4],op2[4]);
xor x6(result[5],op3[5],op2[5]);
xor x7(result[6],op3[6],op2[6]);
xor x8(result[7],op3[7],op2[7]);
nor n1(status[2],result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]);
endmodule