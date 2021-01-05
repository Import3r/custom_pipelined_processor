module EX_MEM_Reg(clk,
//inputs
Ex_mem_in_jump,Ex_mem_in_branch_inst,Ex_mem_in_RegSrc,Ex_mem_in_Mem_Write_Read,
Ex_mem_in_RegWrite,Ex_mem_in_word_byte,Ex_mem_in_MemData,Ex_mem_in_ZF,Ex_mem_in_data_read2,
Ex_mem_in_data_read3,Ex_mem_in_branch_address,Ex_mem_in_ALUOut_EXEC,
Ex_mem_in_write_reg_dest,Ex_mem_in_immediate,Ex_mem_in_how_many_ops,Ex_mem_in_OP1_src, Ex_mem_in_OP2_src,Ex_mem_in_load_signal,Ex_mem_in_forwardStore,Ex_mem_in_write_data,
//outputs
Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,
Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF,Ex_mem_out_data_read2,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_reg_dest,Ex_mem_out_immediate,Ex_mem_out_how_many_ops,Ex_mem_out_OP1_src,Ex_mem_out_OP2_src,Ex_mem_out_load_signal,Ex_mem_out_forwardStore,Ex_mem_out_write_data,valid_EX_MEM
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
input [1:0] Ex_mem_in_jump,Ex_mem_in_branch_inst,Ex_mem_in_RegSrc,Ex_mem_in_Mem_Write_Read,Ex_mem_in_how_many_ops,Ex_mem_in_OP1_src, Ex_mem_in_OP2_src,Ex_mem_in_forwardStore;
input Ex_mem_in_RegWrite,Ex_mem_in_word_byte,Ex_mem_in_MemData,Ex_mem_in_ZF,Ex_mem_in_load_signal;
input [31:0] Ex_mem_in_data_read2,Ex_mem_in_data_read3,Ex_mem_in_branch_address,Ex_mem_in_ALUOut_EXEC,Ex_mem_in_write_data;
input [4:0] Ex_mem_in_write_reg_dest;
input [15:0] Ex_mem_in_immediate;

output reg [1:0] Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,Ex_mem_out_how_many_ops,Ex_mem_out_OP1_src,Ex_mem_out_OP2_src,Ex_mem_out_forwardStore;
output reg Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF,Ex_mem_out_load_signal,valid_EX_MEM;
output reg [31:0] Ex_mem_out_data_read2,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_data;
output reg [4:0] Ex_mem_out_write_reg_dest;
output reg [15:0] Ex_mem_out_immediate;

reg [1:0] Ex_mem_temp_jump,Ex_mem_temp_branch_inst,Ex_mem_temp_RegSrc,Ex_mem_temp_Mem_Write_Read,Ex_mem_temp_how_many_ops,Ex_mem_temp_OP1_src,Ex_mem_temp_OP2_src,Ex_mem_temp_forwardStore;
reg Ex_mem_temp_RegWrite,Ex_mem_temp_word_byte,Ex_mem_temp_MemData,Ex_mem_temp_ZF,Ex_mem_temp_load_signal;
reg [31:0] Ex_mem_temp_data_read2,Ex_mem_temp_data_read3,Ex_mem_temp_branch_address,Ex_mem_temp_ALUOut_EXEC,Ex_mem_temp_write_data;
reg [4:0] Ex_mem_temp_write_reg_dest;
reg [15:0] Ex_mem_temp_immediate;

always @(posedge clk) begin
Ex_mem_out_jump <= Ex_mem_temp_jump;
Ex_mem_out_branch_inst <= Ex_mem_temp_branch_inst;
Ex_mem_out_RegSrc <= Ex_mem_temp_RegSrc;
Ex_mem_out_Mem_Write_Read <= Ex_mem_temp_Mem_Write_Read;
Ex_mem_out_RegWrite <= Ex_mem_temp_RegWrite;
Ex_mem_out_word_byte <= Ex_mem_temp_word_byte;
Ex_mem_out_MemData <= Ex_mem_temp_MemData;
Ex_mem_out_ZF <= Ex_mem_temp_ZF;
Ex_mem_out_data_read2 <= Ex_mem_temp_data_read2;
Ex_mem_out_data_read3 <= Ex_mem_temp_data_read3;
Ex_mem_out_branch_address <= Ex_mem_temp_branch_address;
Ex_mem_out_ALUOut_EXEC <= Ex_mem_temp_ALUOut_EXEC;
Ex_mem_out_write_reg_dest <= Ex_mem_temp_write_reg_dest;
Ex_mem_out_immediate <= Ex_mem_temp_immediate;
Ex_mem_out_how_many_ops <= Ex_mem_temp_how_many_ops;
Ex_mem_out_OP1_src <= Ex_mem_temp_OP1_src;
Ex_mem_out_OP2_src <= Ex_mem_temp_OP2_src;
Ex_mem_out_load_signal <= Ex_mem_temp_load_signal;
Ex_mem_out_forwardStore <= Ex_mem_temp_forwardStore;
Ex_mem_out_write_data <= Ex_mem_temp_write_data;
if(Ex_mem_temp_load_signal == 1'b0 || Ex_mem_temp_load_signal == 1'b1) valid_EX_MEM <= 1'b1;
end

always @(negedge clk) begin
#1 Ex_mem_temp_jump <= Ex_mem_in_jump;
Ex_mem_temp_branch_inst <= Ex_mem_in_branch_inst;
Ex_mem_temp_RegSrc <= Ex_mem_in_RegSrc;
Ex_mem_temp_Mem_Write_Read <= Ex_mem_in_Mem_Write_Read;
Ex_mem_temp_RegWrite <= Ex_mem_in_RegWrite;
Ex_mem_temp_word_byte <= Ex_mem_in_word_byte;
Ex_mem_temp_MemData <= Ex_mem_in_MemData;
Ex_mem_temp_ZF <= Ex_mem_in_ZF;
Ex_mem_temp_data_read2 <= Ex_mem_in_data_read2;
Ex_mem_temp_data_read3 <= Ex_mem_in_data_read3;
Ex_mem_temp_branch_address <= Ex_mem_in_branch_address;
Ex_mem_temp_ALUOut_EXEC <= Ex_mem_in_ALUOut_EXEC;
Ex_mem_temp_write_reg_dest <= Ex_mem_in_write_reg_dest;
Ex_mem_temp_immediate <= Ex_mem_in_immediate;
Ex_mem_temp_how_many_ops <= Ex_mem_in_how_many_ops;
Ex_mem_temp_OP1_src <= Ex_mem_in_OP1_src;
Ex_mem_temp_OP2_src <= Ex_mem_in_OP2_src;
Ex_mem_temp_load_signal <= Ex_mem_in_load_signal;
Ex_mem_temp_forwardStore <= Ex_mem_in_forwardStore;
Ex_mem_temp_write_data <= Ex_mem_in_write_data;
end
endmodule