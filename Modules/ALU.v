module ALU(clk,op1,op2,shamt,ALUsignal,result,ZF);
input clk;
input [31:0] op1,op2;
input [3:0] ALUsignal;
input [4:0] shamt;
output reg [31:0] result;
output reg ZF;

wire [31:0] result_add,result_sub,result_and,result_or,result_nor,result_sltu,result_slt;
reg [31:0] result_sll, result_srl;

add a1(op1,op2,result_add);
sub s1(op1,op2,result_sub);
sltu s2(op1,op2,result_sltu);
slt s3(op1,op2,result_slt);

assign result_and = op1&op2;
assign result_or = op1|op2;
assign result_nor = ~result_or;

always @(negedge clk) begin
ZF = 1'b0;
result_sll = op2 << shamt;
result_srl = op2 >> shamt;

case(ALUsignal)
4'd0: result = result_add;
4'd1: result = result_and;
4'd2: result = result_nor;
4'd3: result = result_or;
4'd4: result = result_slt;
4'd5: result = result_sltu;
4'd6: result = result_sll;
4'd7: result = result_srl;
4'd8: result = result_sub;
endcase
if (result == 'd0) ZF = 1'b1;
end
endmodule