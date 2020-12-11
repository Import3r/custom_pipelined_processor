module ALU(instruction,r1,r2,result,op_code,func,shamt);
input [31:0] instruction;
input [31:0] r1,r2;
output reg [31:0] result;
output reg [5:0] op_code, func;
output reg [4:0] shamt;
wire [31:0] result_add,result_sub,result_and,result_or,result_nor,result_sltu,result_slt;
reg [31:0] result_sll, result_srl;
add a1(r1,r2,result_add);
sub s1(r1,r2,result_sub);
sltu s2(r1,r2,result_sltu);
slt s3(r1,r2,result_slt);
assign result_and = r1&r2;
assign result_or = r1|r2;
assign result_nor = ~result_or;
always @* begin
op_code = instruction[31:26];
func = instruction[5:0];
shamt = instruction[10:6];
result_sll = r2 << shamt;
result_srl = r2 >> shamt;
if	(op_code == 'h3) begin
case(func)
'h20: result = result_add;
'h24: result = result_sub;
'h14: result = result_and;
'h25: result = result_or;
'h27: result = result_nor;
'h2a: result = result_sltu;
'h2b: result = result_slt;
'h00: result = result_sll;
'h02: result = result_srl;
default: result = 'hFFFFFFFF;
endcase
end
end
endmodule