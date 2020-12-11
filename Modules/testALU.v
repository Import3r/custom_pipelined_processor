module testALU();
reg [31:0] inst,op1,op2;
wire [31:0] result;
wire [5:0] op,fun;
wire [4:0] shamt;
initial begin
op1<='h13; op2<='h2F; inst<=32'hD4B4820; //add
#25 op1<='d50; op2<='d70; inst<=32'hD4B4824; //sub
#25 op1<=32'd608010813; op2<=32'd3875044442; inst<=32'hD4B4814;//and
#25 op1<=32'd608010813; op2<=32'd3875044442; inst<=32'hD4B4825;//or
#25 op1<=32'd608010813; op2<=32'd3875044442; inst<=32'hD4B4827;//nor
#25 op1<=32'hFFFFFFFF; op2<=32'd4; inst<=32'hD4B482a;//sltu 0
#25 op1<=32'hFFFFFFFF; op2<=32'd4; inst<=32'hD4B482b;//slt 1
#25 op1<=32'd0; op2<=32'b0110; inst<=32'hd4b4880;//sll
#25 op1<=32'd0; op2<=32'b0110; inst<=32'hd4b4882;//srl
#25 $finish;
end
ALU a1(inst,op1,op2,result,op,fun,shamt);
endmodule