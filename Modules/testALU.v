module testALU();
reg [31:0] op1,op2;
reg [4:0] shamt;
reg [3:0] ALUsignal;
wire [31:0] result;
wire ZF;
initial begin
op1<='h13; op2<='h2F; shamt<=5'd0; ALUsignal <=4'd0; //add
#25 op1<='h2F; op2<='h2F; shamt<=5'd0; ALUsignal <=4'd8; //sub
#25 op1<='h0; op2<='h2F; shamt<=5'd2; ALUsignal <=4'd6; //sll
#25 $finish;
end
ALU a1(op1,op2,shamt,ALUsignal,result,ZF);
endmodule