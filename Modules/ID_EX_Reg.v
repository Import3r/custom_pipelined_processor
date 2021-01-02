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
ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,RegSrc,word_byte,Mem_Write_Read,MemData, data_read1,data_read2,data_read3, signExtenImm,PC_out, rs,rt,rd,funct,shamt,address,immediate,how_many_ops,OP1_src, OP2_src,
//outputs
OUT_ALUop,OUT_RegWrite,OUT_branch_inst,OUT_RegDest,OUT_ALUsrc1,OUT_ALUsrc2,OUT_jump,OUT_RegSrc,OUT_word_byte,OUT_Mem_Write_Read,OUT_MemData,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,OUT_rs,OUT_rt,OUT_rd,OUT_funct,OUT_shamt,OUT_address,OUT_immediate,OUT_how_many_ops,OUT_OP1_src, OUT_OP2_src
);
//inputs
input clk;
input [2:0] ALUop;
input [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc,Mem_Write_Read,how_many_ops,OP1_src, OP2_src;
input RegWrite,ALUsrc1,word_byte,MemData;
input [31:0] data_read1,data_read2,data_read3,signExtenImm,PC_out;
input [4:0] rs,rt,rd,shamt;
input [5:0] funct;
input [26:0] address;
input [15:0] immediate;
//outputs
output reg [2:0] OUT_ALUop;
output reg [1:0] OUT_RegDest,OUT_ALUsrc2,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read, OUT_how_many_ops,OUT_OP1_src, OUT_OP2_src;
output reg OUT_RegWrite,OUT_ALUsrc1,OUT_word_byte,OUT_MemData;
output reg [31:0] OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out;
output reg [4:0] OUT_rs,OUT_rt,OUT_rd,OUT_shamt;
output reg [5:0] OUT_funct;
output reg [26:0] OUT_address;
output reg [15:0] OUT_immediate;
//temps
reg [2:0] TEMP_ALUop;
reg [1:0] TEMP_RegDest,TEMP_ALUsrc2,TEMP_jump,TEMP_branch_inst,TEMP_RegSrc,TEMP_Mem_Write_Read, TEMP_how_many_ops,TEMP_OP1_src, TEMP_OP2_src;
reg TEMP_RegWrite,TEMP_ALUsrc1,TEMP_word_byte,TEMP_MemData;
reg [31:0] TEMP_data_read1,TEMP_data_read2,TEMP_data_read3,TEMP_signExtenImm,TEMP_PC_out;
reg [4:0] TEMP_rs,TEMP_rt,TEMP_rd,TEMP_shamt;
reg [5:0] TEMP_funct;
reg [26:0] TEMP_address;
reg [15:0] TEMP_immediate;
always @(posedge clk) begin
OUT_ALUop <= TEMP_ALUop;
OUT_RegWrite <= TEMP_RegWrite;
OUT_branch_inst <= TEMP_branch_inst;
OUT_RegDest <= TEMP_RegDest;
OUT_ALUsrc1 <= TEMP_ALUsrc1;
OUT_ALUsrc2 <= TEMP_ALUsrc2;
OUT_jump <= TEMP_jump;
OUT_RegSrc <= TEMP_RegSrc;
OUT_word_byte <= TEMP_word_byte;
OUT_Mem_Write_Read <= TEMP_Mem_Write_Read;
OUT_MemData <= TEMP_MemData;
OUT_data_read1 <= TEMP_data_read1;
OUT_data_read2 <= TEMP_data_read2;
OUT_data_read3 <= TEMP_data_read3;
OUT_signExtenImm <= TEMP_signExtenImm;
OUT_PC_out <= TEMP_PC_out;
OUT_rs <= TEMP_rs;
OUT_rt <= TEMP_rt;
OUT_rd <= TEMP_rd;
OUT_funct <= TEMP_funct;
OUT_shamt <= TEMP_shamt;
OUT_address <= TEMP_address;
OUT_immediate <= TEMP_immediate;
OUT_how_many_ops <= TEMP_how_many_ops;
OUT_OP1_src <= TEMP_OP1_src;
OUT_OP2_src <= TEMP_OP2_src;
end

always @(negedge clk) begin
#1 TEMP_ALUop <= ALUop;
TEMP_RegWrite <= RegWrite;
TEMP_branch_inst <= branch_inst;
TEMP_RegDest <= RegDest;
TEMP_ALUsrc1 <= ALUsrc1;
TEMP_ALUsrc2 <= ALUsrc2;
TEMP_jump <= jump;
TEMP_RegSrc <= RegSrc;
TEMP_word_byte <= word_byte;
TEMP_Mem_Write_Read <= Mem_Write_Read;
TEMP_MemData <= MemData;
TEMP_data_read1 <= data_read1;
TEMP_data_read2 <= data_read2;
TEMP_data_read3 <= data_read3;
TEMP_signExtenImm <= signExtenImm;
TEMP_PC_out <= PC_out;
TEMP_rs <= rs;
TEMP_rt <= rt;
TEMP_rd <= rd;
TEMP_funct <= funct;
TEMP_shamt <= shamt;
TEMP_address <= address;
TEMP_immediate <= immediate;
TEMP_how_many_ops <= how_many_ops;
TEMP_OP1_src <= OP1_src;
TEMP_OP2_src <= OP2_src;
end
endmodule