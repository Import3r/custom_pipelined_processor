module testBAdder();
reg [31:0] op1,op2;
wire [31:0] result;

initial begin
op1<='h13; op2<='h2F;
#25 op1<='d5; op2<='d15;
#25 op1<='b1001; op2<='b0001;
#25 $finish;
end

add testAdder(op1,op2,result);
endmodule