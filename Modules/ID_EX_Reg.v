/*INOUTS
Control signals
Read data 1
Read data 2
Read data 3
Sign exten imm
rt
rd
PC_out
*/

module ID_EX_Reg(clk,
//inputs
ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,Read_reg_2,MemData, data_read1,data_read2,data_read3, signExtenImm,PC_out, rt,rd,
//outputs
OUT_ALUop,OUT_RegWrite,OUT_branch_inst,OUT_RegDest,OUT_ALUsrc1,OUT_ALUsrc2,OUT_jump,OUT_zero,OUT_RegSrc,OUT_word_byte,OUT_Mem_Write_Read,OUT_Read_reg_2,OUT_MemData,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,OUT_rt,OUT_rd
);
//inputs
input clk;
input [2:0] ALUop;
input [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc,Mem_Write_Read;
input RegWrite,ALUsrc1,zero,word_byte,Read_reg_2,MemData;
input [31:0] data_read1,data_read2,data_read3,signExtenImm,PC_out;
input [4:0] rt,rd;
//outputs
output reg [2:0] OUT_ALUop;
output reg [1:0] OUT_RegDest,OUT_ALUsrc2,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read;
output reg OUT_RegWrite,OUT_ALUsrc1,OUT_zero,OUT_word_byte,OUT_Read_reg_2,OUT_MemData;
output reg [31:0] OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out;
output reg [4:0] OUT_rt,OUT_rd;
//temps
reg [2:0] TEMP_ALUop;
reg [1:0] TEMP_RegDest,TEMP_ALUsrc2,TEMP_jump,TEMP_branch_inst,TEMP_RegSrc,TEMP_Mem_Write_Read;
reg TEMP_RegWrite,TEMP_ALUsrc1,TEMP_zero,TEMP_word_byte,TEMP_Read_reg_2,TEMP_MemData;
reg [31:0] TEMP_data_read1,TEMP_data_read2,TEMP_data_read3,TEMP_signExtenImm,TEMP_PC_out;
reg [4:0] TEMP_rt,TEMP_rd;

always @(posedge clk) begin
OUT_ALUop <= TEMP_ALUop;
OUT_RegWrite <= TEMP_RegWrite;
OUT_branch_inst <= TEMP_branch_inst;
OUT_RegDest <= TEMP_RegDest;
OUT_ALUsrc1 <= TEMP_ALUsrc1;
OUT_ALUsrc2 <= TEMP_ALUsrc2;
OUT_jump <= TEMP_jump;
OUT_zero <= TEMP_zero;
OUT_RegSrc <= TEMP_RegSrc;
OUT_word_byte <= TEMP_word_byte;
OUT_Mem_Write_Read <= TEMP_Mem_Write_Read;
OUT_Read_reg_2 <= TEMP_Read_reg_2;
OUT_MemData <= TEMP_MemData;
OUT_data_read1 <= TEMP_data_read1;
OUT_data_read2 <= TEMP_data_read2;
OUT_data_read3 <= TEMP_data_read3;
OUT_signExtenImm <= TEMP_signExtenImm;
OUT_PC_out <= TEMP_PC_out;
OUT_rt <= TEMP_rt;
OUT_rd <= TEMP_rd;
end

always @(negedge clk) begin
#1 TEMP_ALUop <= ALUop;
TEMP_RegWrite <= RegWrite;
TEMP_branch_inst <= branch_inst;
TEMP_RegDest <= RegDest;
TEMP_ALUsrc1 <= ALUsrc1;
TEMP_ALUsrc2 <= ALUsrc2;
TEMP_jump <= jump;
TEMP_zero <= zero;
TEMP_RegSrc <= RegSrc;
TEMP_word_byte <= word_byte;
TEMP_Mem_Write_Read <= Mem_Write_Read;
TEMP_Read_reg_2 <= Read_reg_2;
TEMP_MemData <= MemData;
TEMP_data_read1 <= data_read1;
TEMP_data_read2 <= data_read2;
TEMP_data_read3 <= data_read3;
TEMP_signExtenImm <= signExtenImm;
TEMP_PC_out <= PC_out;
TEMP_rt <= rt;
TEMP_rd <= rd;
end
endmodule