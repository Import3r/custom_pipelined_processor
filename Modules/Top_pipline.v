/*
stage1 : instruction fetch (IF)
stage2 : instruction decode and register fetch (ID)
stage3 : execuction stage (EXEC)
stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/

//module Top(PC_VALUE);// testbench holds the PC Value.
module Top_pipline(PC_initial);
input [31:0] PC_initial;
wire [31:0] instruction, program_counter; //opcode & func/ EnableWrite & read write regs
reg [4:0] write_reg,ReadReg2;
reg [31:0] write_data,ALU_op1,ALU_op2,PC_in,PC_4,Write_MEM_Data;
wire [31:0] data_out1, data_out2,Read_data,data_out3,PC_4_out, instruction_out;
wire [4:0] rs, rt, rd;
wire [4:0] shamt;
wire [31:0] ALUOut_EXEC,signExtImm;
wire [5:0] opcode, funct;
wire [15:0] immediate;
wire [25:0] address;
wire clk,ZF,RegWrite,ALUsrc1,zero,word_byte,reg_2_src,MemData;
wire [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc,Mem_Write_Read;
wire [2:0] ALUop;
wire [3:0] ALUcontrol_signal;

wire [2:0] OUT_ALUop;
wire [1:0] OUT_RegDest,OUT_ALUsrc2,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read;
wire OUT_RegWrite,OUT_ALUsrc1,OUT_zero,OUT_word_byte,OUT_Read_reg_2,OUT_MemData;
wire [31:0] OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out;
wire [4:0] OUT_rt,OUT_rd;

clock c1 (clk);
//***IF***//
PC_module main_PC(clk,PC_in,PC_initial, program_counter);
instructionMemory main_instruction_memory(instruction, program_counter);
IF_ID_Reg IF_ID(clk, program_counter+4, instruction,PC_4_out, instruction_out);

//***ID***//
inst_decoding main_inst_decoding(instruction_out, opcode, rs, rt, rd, shamt, funct, immediate, address);

control_unit main_control_unit(opcode, funct, ALUop, RegWrite,branch_inst,RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,reg_2_src,MemData);

sign_extend sign_extend_unit(immediate,signExtImm,zero);

RegisterFile regFile(clk,RegWrite,rs, ReadReg2,rt, write_reg, write_data,data_out1, data_out2,data_out3);

ID_EX_Reg ID_EX(clk,ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,reg_2_src,MemData, data_out1,data_out2,data_out3, signExtImm,PC_4_out, rt,rd,OUT_ALUop,OUT_RegWrite,OUT_branch_inst,OUT_RegDest,OUT_ALUsrc1,OUT_ALUsrc2,OUT_jump,OUT_zero,OUT_RegSrc,OUT_word_byte,OUT_Mem_Write_Read,OUT_Read_reg_2,OUT_MemData,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,OUT_rt,OUT_rd);

always @(posedge clk) begin
#1 PC_in <= program_counter + 4;
//Register read 2 src
case(reg_2_src)
1'b0: ReadReg2 = rt;//rt
1'b1: ReadReg2 = rd;//rd for lwn
endcase
//Register dest mux
case(RegDest)
2'b00: write_reg = rt;
2'b01: write_reg = rd;
2'b10: write_reg = 5'd31; //ra
endcase
//Register source mux
case(RegSrc)
2'b00: write_data = ALUOut_EXEC;//ALUOut_EXEC
2'b01: write_data = Read_data;//Mem
2'b10: write_data = {immediate, 16'b0};//lui
endcase
end
endmodule