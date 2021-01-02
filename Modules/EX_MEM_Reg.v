module EX_MEM_Reg(clk,
//inputs
Ex_mem_in_jump,Ex_mem_in_branch_inst,Ex_mem_in_RegSrc,Ex_mem_in_Mem_Write_Read,
Ex_mem_in_RegWrite,Ex_mem_in_word_byte,Ex_mem_in_MemData,Ex_mem_in_ZF,Ex_mem_in_data_read2,
Ex_mem_in_data_read3,Ex_mem_in_branch_address,Ex_mem_in_ALUOut_EXEC,
Ex_mem_in_write_reg_dest,Ex_mem_in_immediate,Ex_mem_in_how_many_ops,OUT_OP1_src, OUT_OP2_src,
//outputs
Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,
Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF,Ex_mem_out_data_read2,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_reg_dest,Ex_mem_out_immediate,Ex_mem_out_how_many_ops,Ex_mem_out_OP1_src,Ex_mem_out_OP2_src
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
input [1:0] Ex_mem_in_jump,Ex_mem_in_branch_inst,Ex_mem_in_RegSrc,Ex_mem_in_Mem_Write_Read,Ex_mem_in_how_many_ops,OUT_OP1_src, OUT_OP2_src;
input Ex_mem_in_RegWrite,Ex_mem_in_word_byte,Ex_mem_in_MemData,Ex_mem_in_ZF;
input [31:0] Ex_mem_in_data_read2,Ex_mem_in_data_read3,Ex_mem_in_branch_address,Ex_mem_in_ALUOut_EXEC;
input [4:0] Ex_mem_in_write_reg_dest;
input [15:0] Ex_mem_in_immediate;

output reg [1:0] Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,Ex_mem_out_how_many_ops,Ex_mem_out_OP1_src,Ex_mem_out_OP2_src;
output reg Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF;
output reg [31:0] Ex_mem_out_data_read2,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC;
output reg [4:0] Ex_mem_out_write_reg_dest;
output reg [15:0] Ex_mem_out_immediate;

reg [1:0] Ex_mem_temp_jump,Ex_mem_temp_branch_inst,Ex_mem_temp_RegSrc,Ex_mem_temp_Mem_Write_Read,Ex_mem_temp_how_many_ops,Ex_mem_temp_OP1_src,Ex_mem_temp_OP2_src;
reg Ex_mem_temp_RegWrite,Ex_mem_temp_word_byte,Ex_mem_temp_MemData,Ex_mem_temp_ZF;
reg [31:0] Ex_mem_temp_data_read2,Ex_mem_temp_data_read3,Ex_mem_temp_branch_address,Ex_mem_temp_ALUOut_EXEC;
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
Ex_mem_temp_OP1_src <= OUT_OP1_src;
Ex_mem_temp_OP2_src <= OUT_OP2_src;
end
endmodule