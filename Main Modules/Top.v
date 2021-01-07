/*
stage1 : instruction fetch (IF)
stage2 : instruction decode and register fetch (ID)
stage3 : execuction stage (EXEC)
stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/
module Top(PC_initial); // testbench holds the PC Value.
input [31:0] PC_initial;
//*************32-bits Wires*************//
wire [31:0] instruction, program_counter,data_out1, data_out2,Read_data,data_out3,PC_4_out, instruction_out,OUT_write_data,ALUOut_EXEC,signExtImm,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_data_read2,mem_wb_out_ALUOut_EXEC,mem_wb_out_Mem_dataOut,Ex_mem_out_write_data;

//*************26-bits Wires*************//
wire [25:0] address, OUT_address;

//*************16-bits Wires*************//
wire [15:0] immediate,OUT_immediate,Ex_mem_out_immediate,mem_wb_out_immediate;

//*************6-bits Wires*************//
wire [5:0] opcode, funct,OUT_funct;

//*************5-bits Wires*************//
wire [4:0] rs, rt, rd, shamt,OUT_rs,OUT_rt,OUT_rd,OUT_shamt,Ex_mem_out_write_reg_dest,mem_wb_out_write_reg_dest;

//*************4-bits Wires*************//
wire [3:0] ALUcontrol_signal;

//*************3-bits Wires*************//
wire [2:0] ALUop,OUT_ALUop;

//*************2-bits Wires*************//
wire [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc,Mem_Write_Read,OUT_RegDest,OUT_ALUsrc2,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read,OUT_how_many_ops,OUT_OP1_src, OUT_OP2_src,Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,OP1_src, OP2_src,Ex_mem_out_how_many_ops,Ex_mem_out_OP1_src,Ex_mem_out_OP2_src,forwardStore,Ex_mem_out_forwardStore,mem_wb_out_RegSrc,forwardA,forwardB,how_many_ops,OUT_load_useA,OUT_load_useB;

//*************1-bit Wires*************//
wire Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF,store_signal,OUT_store_signal,mem_wb_out_RegWrite,Temp_PC_write,Temp_IF_ID_write,Temp_flush,OUT_load_signal,valid,valid_EX_MEM,clk,ZF,RegWrite,ALUsrc1,zero,word_byte,reg_2_src,MemData,OUT_RegWrite,OUT_ALUsrc1,OUT_word_byte,OUT_MemData,load_signal;

//*************32-bits Regs*************//
reg [31:0] write_data,ALU_op1,ALU_op2,PC_in,PC_4,Write_MEM_Data,branch_address,jump_address,jump_register;

//*************5-bits Regs*************//
reg [4:0] write_reg,ReadReg2,write_reg_temp;

//*************2-bits Regs*************//
reg [1:0] pcSrc;

//*************1-bit Regs*************//
reg PC_write,IF_ID_write,flush,flush_IF;

initial begin
PC_write = 1'b1;
IF_ID_write = 1'b1;
flush = 1'b0;
end

clock main_clock (clk);
//***IF***//
PC_module main_PC(clk,PC_in,PC_initial, program_counter,PC_write);
instructionMemory main_instruction_memory(instruction, program_counter);
IF_ID_Reg IF_ID(clk, IF_ID_write,flush_IF,program_counter+4, instruction,PC_4_out, instruction_out);

//***ID***//
inst_decoding main_inst_decoding(instruction_out, opcode, rs, rt, rd, shamt, funct, immediate, address);

control_unit main_control_unit(opcode, funct, ALUop, RegWrite,branch_inst,RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,reg_2_src,MemData,OP1_src, OP2_src,how_many_ops,load_signal,store_signal);

sign_extend sign_extend_unit(immediate,signExtImm,zero);

RegisterFile regFile(clk,mem_wb_out_RegWrite,rs,ReadReg2,rt, mem_wb_out_write_reg_dest, write_data,data_out1,data_out2,data_out3);

ID_EX_Reg ID_EX(flush,clk,ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,RegSrc,word_byte,Mem_Write_Read,MemData, data_out1,data_out2,data_out3, signExtImm,PC_4_out, rs,rt,rd,funct,shamt,address,immediate,how_many_ops,OP1_src, OP2_src,load_signal,store_signal,write_data,
OUT_ALUop,OUT_RegWrite,OUT_branch_inst,OUT_RegDest,OUT_ALUsrc1,OUT_ALUsrc2,OUT_jump,OUT_RegSrc,OUT_word_byte,OUT_Mem_Write_Read,OUT_MemData,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,OUT_rs,OUT_rt,OUT_rd,OUT_funct,OUT_shamt,OUT_address,OUT_immediate,OUT_how_many_ops,OUT_OP1_src, OUT_OP2_src,OUT_load_signal,OUT_store_signal,OUT_write_data);

hazard_detection_unit main_hazard_unit(OUT_load_signal,rs,rt,rd,how_many_ops,OUT_rt,OUT_Mem_Write_Read,OP1_src,OP2_src,Temp_PC_write,Temp_IF_ID_write,Temp_flush,valid);

//***EX***//
ALUcontrol main_ALUcontrol_unit(OUT_ALUop, OUT_funct,ALUcontrol_signal);

ALU main_ALU(clk,ALU_op1,ALU_op2,OUT_shamt,ALUcontrol_signal,ALUOut_EXEC,ZF);

EX_MEM_Reg EX_MEM(clk,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read,OUT_RegWrite,OUT_word_byte,OUT_MemData,ZF,OUT_data_read2,OUT_data_read3,branch_address,ALUOut_EXEC,write_reg_temp,OUT_immediate,OUT_how_many_ops,OUT_OP1_src, OUT_OP2_src,forwardStore,OUT_write_data,
//outs
Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,
Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF,Ex_mem_out_data_read2,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_reg_dest,Ex_mem_out_immediate,Ex_mem_out_how_many_ops,Ex_mem_out_OP1_src,Ex_mem_out_OP2_src,Ex_mem_out_forwardStore,Ex_mem_out_write_data
);

//***MEM***//
DataMemory main_data_memory(clk,Ex_mem_out_ALUOut_EXEC,Write_MEM_Data,Ex_mem_out_Mem_Write_Read,Read_data,Ex_mem_out_word_byte);

MEM_WB_Reg MEM_WB(clk,
//in
Ex_mem_out_RegSrc,Ex_mem_out_RegWrite,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_reg_dest,Read_data,Ex_mem_out_immediate,
//out
mem_wb_out_RegSrc,mem_wb_out_RegWrite,mem_wb_out_ALUOut_EXEC,mem_wb_out_write_reg_dest,mem_wb_out_Mem_dataOut,mem_wb_out_immediate
);

forwarding_unit main_forwarding_unit(Ex_mem_out_RegWrite, Ex_mem_out_write_reg_dest, mem_wb_out_RegWrite, mem_wb_out_write_reg_dest, OUT_rs, OUT_rt,OUT_rd,forwardA,forwardB,OUT_OP1_src, OUT_OP2_src,OUT_how_many_ops,forwardStore,OUT_store_signal);

always @(posedge clk) begin
#1
if (valid) begin
PC_write = Temp_PC_write;
IF_ID_write = Temp_IF_ID_write;
flush = Temp_flush;
end

flush_IF = 1'b0;
branch_address = PC_4_out+(signExtImm<<2); //Calculating branch address
jump_address = {PC_4_out[31:28],address<<2}; //Calculating jump address
jump_register = data_out3; //Calculating jump register address
pcSrc = 2'b00; //Defualt PC (PC+4)

//Register 2 src
case(reg_2_src)
1'b0: ReadReg2 = rt;//rt
1'b1: ReadReg2 = rd;//rd for lwn
endcase

//Register source mux
case(mem_wb_out_RegSrc)
2'b00: write_data = mem_wb_out_ALUOut_EXEC;//ALUOut_EXEC
2'b01: write_data = mem_wb_out_Mem_dataOut;//Mem
2'b10: write_data = {mem_wb_out_immediate, 16'b0};//lui
endcase


//ALU sources muxes
case(forwardA)
2'b00: begin
case (OUT_ALUsrc1)
1'b0: ALU_op1 = 5'd0;//$0
1'b1: ALU_op1 = OUT_data_read1;
endcase
end
2'b10: ALU_op1 = Ex_mem_out_ALUOut_EXEC; //EX Hazard
2'b01: ALU_op1 = write_data; //MEM Hazard
endcase //end forwarding A
//B
case(forwardB)
2'b00: begin
case (OUT_ALUsrc2)
2'b00: ALU_op2 = OUT_data_read2; //rt||rd
2'b01: ALU_op2 = OUT_signExtenImm; //imm
2'b10: ALU_op2 = OUT_PC_out+4; //PC+8
endcase
end
2'b10: ALU_op2 = Ex_mem_out_ALUOut_EXEC; //EX Hazard
2'b01: ALU_op2 = write_data; //MEM Hazard
endcase //end forwarding B

//Register dest mux
case(OUT_RegDest)
2'b00: write_reg_temp = OUT_rt;
2'b01: write_reg_temp = OUT_rd;
2'b10: write_reg_temp = 5'd31; //ra
endcase


if (jump == 2'b00) begin
//branches
if(branch_inst == 2'b01) begin
if(data_out1 == data_out3) begin pcSrc = 2'b10;//beq
flush_IF = 1'b1;
end
end

else if(branch_inst == 2'b10) begin
if(!(data_out1 == data_out3)) begin pcSrc = 2'b10;//bne
flush_IF = 1'b1;
end
end
end

case(jump)
2'b01: begin
pcSrc = 2'b01;
flush_IF = 1'b1;
end
//Jump register instruction
2'b10: begin
pcSrc = 2'b11;
flush_IF = 1'b1;
end
endcase

//Next program_counter mux
if (PC_write) begin
case(pcSrc)
2'b00: PC_in = program_counter + 4;//PC+4
2'b01: PC_in = jump_address;//jump
2'b11: PC_in = jump_register;//jump reg
2'b10: PC_in = branch_address;//branch
endcase
end

case(Ex_mem_out_forwardStore)
2'b00: begin
case(Ex_mem_out_MemData)
1'b0: Write_MEM_Data = Ex_mem_out_data_read2; //sw,sb
1'b1: Write_MEM_Data = Ex_mem_out_data_read3; //swn
endcase
end
2'b01: Write_MEM_Data = Ex_mem_out_write_data;//MEM Hazard
2'b10: Write_MEM_Data = write_data;//EX Hazard
endcase
end
endmodule