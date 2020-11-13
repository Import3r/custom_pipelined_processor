module registers(RS1,RS2,RS3,op1,op2,op3);
input [3:0] RS1,RS2,RS3;
output reg [7:0] op1,op2,op3;
reg [7:0] temps [15:0];
always@* begin
temps[0]= 8'b00000000;
temps[1]= 8'b00000001;
temps[2]= 8'b00000010;
temps[3]= 8'b00000011;
temps[4]= 8'b00000100;
temps[5]= 8'b00000101;
temps[6]= 8'b00000110;
temps[7]= 8'b00000111;
temps[8]= 8'b00001000;
temps[9]= 8'b00001001;
temps[10]= 8'b00001010;
temps[11]= 8'b00001011;
temps[12]= 8'b00001100;
temps[13]= 8'b00001101;
temps[14]= 8'b00001110;
temps[15]= 8'b00001111;

op1 = temps[RS1];
op2 = temps[RS2];
op3 = temps[RS3];
end
endmodule