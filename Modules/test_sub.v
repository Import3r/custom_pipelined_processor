module test_sub();
reg [31:0] op1,op2;
wire [31:0] result;

initial begin
op1<='d13; op2<='d20;
#25 op1<='d5; op2<='d15;
#25 op1<='d9; op2<='d1;
#25 $finish;
end

sub test_sub(op1,op2,result);
endmodule