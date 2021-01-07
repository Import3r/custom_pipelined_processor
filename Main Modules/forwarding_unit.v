module forwarding_unit(EX_MEM_RegWrite, EX_MEM_RegDest, MEM_WB_RegWrite, MEM_WB_RegDest, ID_EX_Rs, ID_EX_Rt, ID_EX_Rd,forwardA,forwardB,EX_MEM_OP1_src, EX_MEM_OP2_src, EX_MEM_how_many_ops,forwardStore,ID_EX_store_signal);
input EX_MEM_RegWrite,MEM_WB_RegWrite,ID_EX_store_signal;
input [1:0] EX_MEM_OP1_src, EX_MEM_OP2_src,EX_MEM_how_many_ops;
input [4:0] EX_MEM_RegDest, ID_EX_Rs, ID_EX_Rt, ID_EX_Rd,MEM_WB_RegDest;
output reg[1:0] forwardA, forwardB,forwardStore;
reg [4:0] OP1, OP2;
initial begin
forwardA = 2'b00; //defualt case
forwardB = 2'b00;
forwardStore = 2'b00;
end

always @* begin
forwardA = 2'b00;
forwardB = 2'b00;
forwardStore = 2'b00;
case(EX_MEM_OP1_src)
2'b00: OP1 = ID_EX_Rs;
2'b01: OP1 = ID_EX_Rt;
2'b10: OP1 = ID_EX_Rd;
endcase
case(EX_MEM_OP2_src)
2'b00: OP2 = ID_EX_Rs;
2'b01: OP2 = ID_EX_Rt;
2'b10: OP2 = ID_EX_Rd;
endcase

//MEM
if(ID_EX_store_signal && MEM_WB_RegWrite && (MEM_WB_RegDest != 5'd0) && MEM_WB_RegDest == ID_EX_Rt)
begin
forwardStore = 2'b01;
end

if(EX_MEM_how_many_ops != 2'b00 && MEM_WB_RegWrite && (MEM_WB_RegDest != 5'd0) && MEM_WB_RegDest == OP1) begin
forwardA = 2'b01;
if(EX_MEM_how_many_ops == 2'b10 && MEM_WB_RegWrite && (MEM_WB_RegDest != 5'd0) && MEM_WB_RegDest == OP2) forwardB = 2'b01;
end

if(EX_MEM_how_many_ops == 2'b10 && MEM_WB_RegWrite && (MEM_WB_RegDest != 5'd0) && MEM_WB_RegDest == OP2) begin
forwardB = 2'b01;
if(MEM_WB_RegWrite && (MEM_WB_RegDest != 5'd0) && MEM_WB_RegDest == OP1) forwardA = 2'b01;
end
// EX Hazard
if(ID_EX_store_signal && EX_MEM_RegWrite && (EX_MEM_RegDest != 5'd0) && EX_MEM_RegDest == ID_EX_Rt)
begin
forwardStore = 2'b10;
end
if(EX_MEM_how_many_ops != 2'b00 && EX_MEM_RegWrite && (EX_MEM_RegDest != 5'd0) && EX_MEM_RegDest == OP1) begin
forwardA = 2'b10;
if(EX_MEM_how_many_ops == 2'b10 && EX_MEM_RegWrite && (EX_MEM_RegDest != 5'd0) && EX_MEM_RegDest == OP2) forwardB = 2'b10;
end

if(EX_MEM_how_many_ops == 2'b10 && EX_MEM_RegWrite && (EX_MEM_RegDest != 5'd0) && EX_MEM_RegDest == OP2) begin
forwardB = 2'b10;
if(EX_MEM_RegWrite && (EX_MEM_RegDest != 5'd0) && EX_MEM_RegDest == OP1) forwardA = 2'b10;
end

end
endmodule