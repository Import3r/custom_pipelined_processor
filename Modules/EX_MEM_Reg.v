module EX_MEM_Reg(clk,
//inputs
ID_Ex_in_jump,ID_Ex_in_branch_inst,ID_Ex_in_RegSrc,ID_Ex_in_Mem_Write_Read,
ID_Ex_in_RegWrite,ID_Ex_in_word_byte,ID_Ex_in_MemData,ID_Ex_in_ZF,
ID_Ex_in_data_read3,ID_Ex_in_branch_address,ID_Ex_in_ALUOut_EXEC,
ID_Ex_in_write_reg_dest,
//outputs
ID_Ex_out_jump,ID_Ex_out_branch_inst,ID_Ex_out_RegSrc,ID_Ex_out_Mem_Write_Read,
ID_Ex_out_RegWrite,ID_Ex_out_word_byte,ID_Ex_out_MemData,ID_Ex_out_ZF,
ID_Ex_out_data_read3,ID_Ex_out_branch_address,ID_Ex_out_ALUOut_EXEC,
ID_Ex_out_write_reg_dest
);
input clk;
/*
control signals
branch address
ALU res
ZF
mem write data
reg dest
*/
input [1:0] ID_Ex_in_jump,ID_Ex_in_branch_inst,ID_Ex_in_RegSrc,ID_Ex_in_Mem_Write_Read;
input ID_Ex_in_RegWrite,ID_Ex_in_word_byte,ID_Ex_in_MemData,ID_Ex_in_ZF;
input [31:0] ID_Ex_in_data_read3,ID_Ex_in_branch_address,ID_Ex_in_ALUOut_EXEC;
input [4:0] ID_Ex_in_write_reg_dest;

output reg [1:0] ID_Ex_out_jump,ID_Ex_out_branch_inst,ID_Ex_out_RegSrc,ID_Ex_out_Mem_Write_Read;
output reg ID_Ex_out_RegWrite,ID_Ex_out_word_byte,ID_Ex_out_MemData,ID_Ex_out_ZF;
output reg [31:0] ID_Ex_out_data_read3,ID_Ex_out_branch_address,ID_Ex_out_ALUOut_EXEC;
output reg [4:0] ID_Ex_out_write_reg_dest;

reg [1:0] ID_Ex_temp_jump,ID_Ex_temp_branch_inst,ID_Ex_temp_RegSrc,ID_Ex_temp_Mem_Write_Read;
reg ID_Ex_temp_RegWrite,ID_Ex_temp_word_byte,ID_Ex_temp_MemData,ID_Ex_temp_ZF;
reg [31:0] ID_Ex_temp_data_read3,ID_Ex_temp_branch_address,ID_Ex_temp_ALUOut_EXEC;
reg [4:0] ID_Ex_temp_write_reg_dest;

always @(posedge clk) begin
ID_Ex_out_jump <= ID_Ex_temp_jump;
ID_Ex_out_branch_inst <= ID_Ex_temp_branch_inst;
ID_Ex_out_RegSrc <= ID_Ex_temp_RegSrc;
ID_Ex_out_Mem_Write_Read <= ID_Ex_temp_Mem_Write_Read;
ID_Ex_out_RegWrite <= ID_Ex_temp_RegWrite;
ID_Ex_out_word_byte <= ID_Ex_temp_word_byte;
ID_Ex_out_MemData <= ID_Ex_temp_MemData;
ID_Ex_out_ZF <= ID_Ex_temp_ZF;
ID_Ex_out_data_read3 <= ID_Ex_temp_data_read3;
ID_Ex_out_branch_address <= ID_Ex_temp_branch_address;
ID_Ex_out_ALUOut_EXEC <= ID_Ex_temp_ALUOut_EXEC;
ID_Ex_out_write_reg_dest <= ID_Ex_temp_write_reg_dest;
end

always @(negedge clk) begin
#1 ID_Ex_temp_jump <= ID_Ex_in_jump;
ID_Ex_temp_branch_inst <= ID_Ex_in_branch_inst;
ID_Ex_temp_RegSrc <= ID_Ex_in_RegSrc;
ID_Ex_temp_Mem_Write_Read <= ID_Ex_in_Mem_Write_Read;
ID_Ex_temp_RegWrite <= ID_Ex_in_RegWrite;
ID_Ex_temp_word_byte <= ID_Ex_in_word_byte;
ID_Ex_temp_MemData <= ID_Ex_in_MemData;
ID_Ex_temp_ZF <= ID_Ex_in_ZF;
ID_Ex_temp_data_read3 <= ID_Ex_in_data_read3;
ID_Ex_temp_branch_address <= ID_Ex_in_branch_address;
ID_Ex_temp_ALUOut_EXEC <= ID_Ex_in_ALUOut_EXEC;
ID_Ex_temp_write_reg_dest <= ID_Ex_in_write_reg_dest;
end
endmodule