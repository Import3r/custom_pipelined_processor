module testALU();
reg [3:0] RS1,RS2,RS3,op;
wire [3:0] status;
wire [7:0] result;

initial begin
RS1<= 4'b0000; op<=4'b0000; //One’s complement 
#25 RS1<= 4'b0111; op<=4'b1010; //Two’s complement
#25 RS1<= 4'b0010; op<=4'b1000;//Logical Shift Right for Op1
#25 RS1<= 4'b0010; RS2<= 4'b0100; RS3<= 4'b0001; op<=4'b1110;//Multiplication and addition
#25 RS1<= 4'b0010; RS2<= 4'b0100; RS3<= 4'b0001; op<=4'b1111;//Multiplication and subtraction
#25 RS2<= 4'b0100; RS3<= 4'b0001; op<=4'b0111;//XOR
#25 op<=4'b1001;//Parity generation (for xor result)
#25 RS1<= 4'b0110; RS2<= 4'b0100; op<=4'b1011;//Addition 
#25 RS1<= 4'b0110; RS2<= 4'b0100; op<=4'b1100;//Subtraction  
#25 RS1<= 4'b0010; RS2<= 4'b0100; op<=4'b1101;//Multiplication
#25 $finish;
end
ALU a1(result,status,RS1,RS2,RS3,op);
endmodule