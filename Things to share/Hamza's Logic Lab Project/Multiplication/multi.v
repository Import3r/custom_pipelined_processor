module multi(op1,op2,result,status);
input [7:0] op1,op2;
output reg [7:0] result;
output reg [3:0] status;
reg [15:0] temp;
wire z_flag,carry;
always @* begin
temp = op1*op2;
result = temp;
status[2] = z_flag;
status[3] = carry;
end
nor n1(z_flag,result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]);//Zero
or o1(carry,temp[15],temp[14],temp[13],temp[12],temp[11],temp[10],temp[9],temp[8]);//Carry
endmodule
