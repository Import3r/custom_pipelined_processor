module hazard_detection_unit(Load_signal,rs,rt,rd,how_many_ops,ID_EXE_rt,ID_EXE_MemRead,op1_selector,op2_selector,PC_write,IF_ID_write,flush,valid);
input Load_signal;
input [1:0] op1_selector,op2_selector,how_many_ops,ID_EXE_MemRead;
input [4:0] rs,rt,rd,ID_EXE_rt;
output reg PC_write, IF_ID_write, flush,valid;
reg [4:0] OP1,OP2;
always @* begin
valid = 1'b1;
PC_write = 1'b1;
IF_ID_write = 1'b1;
flush = 1'b0;
case(op1_selector)
2'b00: OP1 = rs;
2'b01: OP1 = rt;
2'b10: OP1 = rd;
endcase
case(op2_selector)
2'b00: OP2 = rs;
2'b01: OP2 = rt;
2'b10: OP2 = rd;
endcase
if(Load_signal == 1'b1) begin
if (how_many_ops != 2'b00 && ID_EXE_MemRead == 2'b10 && ID_EXE_rt == OP1)begin
PC_write = 1'b0;
IF_ID_write = 1'b0;
flush = 1'b1;
end
if (how_many_ops == 2'b10 && ID_EXE_MemRead == 2'b10 && ID_EXE_rt == OP2)begin
PC_write = 1'b0;
IF_ID_write = 1'b0;
flush = 1'b1;
end
end
end
endmodule