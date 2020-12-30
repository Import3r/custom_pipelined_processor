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
reg [4:0] write_reg,ReadReg2,write_reg_temp;
reg [31:0] write_data,ALU_op1,ALU_op2,PC_in,PC_4,Write_MEM_Data,bransh_address;
wire [31:0] data_out1, data_out2,Read_data,data_out3,PC_4_out, instruction_out;
wire [4:0] rs, rt, rd;
wire [4:0] shamt;
wire [31:0] ALUOut_EXEC,signExtImm;
wire [5:0] opcode, funct,OUT_funct;
wire [15:0] immediate;
wire [25:0] address;
wire clk,ZF,RegWrite,ALUsrc1,zero,word_byte,reg_2_src,MemData;
wire [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc,Mem_Write_Read;
wire [2:0] ALUop;
wire [3:0] ALUcontrol_signal;

wire [2:0] OUT_ALUop;
wire [1:0] OUT_RegDest,OUT_ALUsrc2,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read;
wire OUT_RegWrite,OUT_ALUsrc1,OUT_word_byte,OUT_MemData;
wire [31:0] OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out;
wire [4:0] OUT_rt,OUT_rd,OUT_shamt;


wire [1:0] ID_Ex_out_jump,ID_Ex_out_branch_inst,ID_Ex_out_RegSrc,ID_Ex_out_Mem_Write_Read;
wire ID_Ex_out_RegWrite,ID_Ex_out_word_byte,ID_Ex_out_MemData,ID_Ex_out_ZF;
wire [31:0] ID_Ex_out_data_read3,ID_Ex_out_branch_address,ID_Ex_out_ALUOut_EXEC;
wire [4:0] ID_Ex_out_write_reg_dest;

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

ID_EX_Reg ID_EX(clk,ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,RegSrc,word_byte,Mem_Write_Read,MemData, data_out1,data_out2,data_out3, signExtImm,PC_4_out, rt,rd,funct,shamt,OUT_ALUop,OUT_RegWrite,OUT_branch_inst,OUT_RegDest,OUT_ALUsrc1,OUT_ALUsrc2,OUT_jump,OUT_RegSrc,OUT_word_byte,OUT_Mem_Write_Read,OUT_MemData,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,OUT_rt,OUT_rd,OUT_funct,OUT_shamt);

//***EX***//
ALUcontrol main_ALUcontrol_unit(OUT_ALUop, OUT_funct,ALUcontrol_signal);

ALU main_ALU(clk,ALU_op1,ALU_op2,OUT_shamt,ALUcontrol_signal,ALUOut_EXEC,ZF);

EX_MEM_Reg EX_MEM(clk,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read,OUT_RegWrite,OUT_word_byte,OUT_MemData,ZF,OUT_data_read3,bransh_address,ALUOut_EXEC,write_reg_temp,
//outs
ID_Ex_out_jump,ID_Ex_out_branch_inst,ID_Ex_out_RegSrc,ID_Ex_out_Mem_Write_Read,
ID_Ex_out_RegWrite,ID_Ex_out_word_byte,ID_Ex_out_MemData,ID_Ex_out_ZF,
ID_Ex_out_data_read3,ID_Ex_out_branch_address,ID_Ex_out_ALUOut_EXEC,
ID_Ex_out_write_reg_dest
);

always @(posedge clk) begin
#1 PC_in <= program_counter + 4;
bransh_address = OUT_PC_out+(OUT_signExtenImm<<2);
//Register read 2 src
case(reg_2_src)
1'b0: ReadReg2 = rt;//rt
1'b1: ReadReg2 = rd;//rd for lwn
endcase

//Register source mux
case(RegSrc)
2'b00: write_data = ALUOut_EXEC;//ALUOut_EXEC
2'b01: write_data = Read_data;//Mem
2'b10: write_data = {immediate, 16'b0};//lui
endcase
//ALU sources muxes
case (OUT_ALUsrc2)
2'b00: ALU_op2 = OUT_data_read2; //rt||rd
2'b01: ALU_op2 = OUT_signExtenImm; //imm
2'b10: ALU_op2 = OUT_PC_out+4; //PC+8
endcase
case (OUT_ALUsrc1)
1'b0: ALU_op1 = 5'd0;//$0
1'b1: ALU_op1 = OUT_data_read1;
endcase
//Register dest mux
case(OUT_RegDest)
2'b00: write_reg_temp = OUT_rt;
2'b01: write_reg_temp = OUT_rd;
2'b10: write_reg_temp = 5'd31; //ra
endcase
//Next program_counter mux
case(OUT_jump)
//Choosing between PC+4 and branches
2'b00: begin
if(OUT_branch_inst == 2'b01) begin
if(ZF) PC_in <= OUT_PC_out+(OUT_signExtenImm<<2);//beq
else #1 PC_in <= program_counter + 4;
end

else if(OUT_branch_inst == 2'b10) begin
if(!ZF)  PC_in <= OUT_PC_out+(OUT_signExtenImm<<2);//bne
else #1 PC_in <= program_counter + 4;
end

else if(OUT_branch_inst == 2'b00) begin
#1 PC_in <= program_counter + 4;
end

end
/*Jump instruction
2'b01: PC_in = {PC_4[31:28],address<<2};
//Jump register instruction
2'b10: PC_in = data_out2; to implement 2nd stage*/
endcase
end
endmodule