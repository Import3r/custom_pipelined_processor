module oneComp(op1,result);
input [7:0] op1;
output [7:0] result;
not G0(result[0],op1[0]);
not G1(result[1],op1[1]);
not G2(result[2],op1[2]);
not G3(result[3],op1[3]);
not G4(result[4],op1[4]);
not G5(result[5],op1[5]);
not G6(result[6],op1[6]);
not G7(result[7],op1[7]);
endmodule