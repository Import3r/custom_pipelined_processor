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


wire [1:0] Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read;
wire Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF;
wire [31:0] Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_data_read2;
wire [4:0] Ex_mem_out_write_reg_dest;

wire [1:0] mem_wb_out_RegSrc;
wire mem_wb_out_RegWrite;
wire [31:0] mem_wb_out_ALUOut_EXEC,mem_wb_out_Mem_dataOut;
wire [4:0] mem_wb_out_write_reg_dest;

clock c1 (clk);
//***IF***//
PC_module main_PC(clk,PC_in,PC_initial, program_counter);
instructionMemory main_instruction_memory(instruction, program_counter);
IF_ID_Reg IF_ID(clk, program_counter+4, instruction,PC_4_out, instruction_out);

//***ID***//
inst_decoding main_inst_decoding(instruction_out, opcode, rs, rt, rd, shamt, funct, immediate, address);

control_unit main_control_unit(opcode, funct, ALUop, RegWrite,branch_inst,RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,reg_2_src,MemData);

sign_extend sign_extend_unit(immediate,signExtImm,zero);

RegisterFile regFile(clk,mem_wb_out_RegWrite,rs, ReadReg2,rt, mem_wb_out_write_reg_dest, write_data,data_out1, data_out2,data_out3);

ID_EX_Reg ID_EX(clk,ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,RegSrc,word_byte,Mem_Write_Read,MemData, data_out1,data_out2,data_out3, signExtImm,PC_4_out, rt,rd,funct,shamt,OUT_ALUop,OUT_RegWrite,OUT_branch_inst,OUT_RegDest,OUT_ALUsrc1,OUT_ALUsrc2,OUT_jump,OUT_RegSrc,OUT_word_byte,OUT_Mem_Write_Read,OUT_MemData,OUT_data_read1,OUT_data_read2,OUT_data_read3,OUT_signExtenImm,OUT_PC_out,OUT_rt,OUT_rd,OUT_funct,OUT_shamt);

//***EX***//
ALUcontrol main_ALUcontrol_unit(OUT_ALUop, OUT_funct,ALUcontrol_signal);

ALU main_ALU(clk,ALU_op1,ALU_op2,OUT_shamt,ALUcontrol_signal,ALUOut_EXEC,ZF);

EX_MEM_Reg EX_MEM(clk,OUT_jump,OUT_branch_inst,OUT_RegSrc,OUT_Mem_Write_Read,OUT_RegWrite,OUT_word_byte,OUT_MemData,ZF,OUT_data_read2,OUT_data_read3,bransh_address,ALUOut_EXEC,write_reg_temp,
//outs
Ex_mem_out_jump,Ex_mem_out_branch_inst,Ex_mem_out_RegSrc,Ex_mem_out_Mem_Write_Read,
Ex_mem_out_RegWrite,Ex_mem_out_word_byte,Ex_mem_out_MemData,Ex_mem_out_ZF,Ex_mem_out_data_read2,Ex_mem_out_data_read3,Ex_mem_out_branch_address,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_reg_dest
);

//***MEM***//
DataMemory main_data_memory(clk,Ex_mem_out_ALUOut_EXEC,Write_MEM_Data,Ex_mem_out_Mem_Write_Read,Read_data,Ex_mem_out_word_byte);

MEM_WB_Reg MEM_WB(clk,
//in
Ex_mem_out_RegSrc,Ex_mem_out_RegWrite,Ex_mem_out_ALUOut_EXEC,Ex_mem_out_write_reg_dest,Read_data,
//out
mem_wb_out_RegSrc,mem_wb_out_RegWrite,mem_wb_out_ALUOut_EXEC,mem_wb_out_write_reg_dest,mem_wb_out_Mem_dataOut
);
always @(posedge clk) begin
#1 //NEVER REMOVE THIS SHIT. THANKS. [31/12/2020 1:47 AM]
bransh_address = OUT_PC_out+(OUT_signExtenImm<<2);
//Register read 2 src
case(reg_2_src)
1'b0: ReadReg2 = rt;//rt
1'b1: ReadReg2 = rd;//rd for lwn
endcase

//Register source mux
case(mem_wb_out_RegSrc)
2'b00: write_data = mem_wb_out_ALUOut_EXEC;//ALUOut_EXEC
2'b01: write_data = mem_wb_out_Mem_dataOut;//Mem
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
if (Ex_mem_out_jump == 2'b00) begin
//branches
if(Ex_mem_out_branch_inst == 2'b01) begin
if(Ex_mem_out_ZF) begin PC_in = Ex_mem_out_branch_address;//beq
end
end

else if(Ex_mem_out_branch_inst == 2'b10) begin
if(!Ex_mem_out_ZF) PC_in = Ex_mem_out_branch_address;//bne
end
end

else begin
PC_in = program_counter + 4;
end
case(Ex_mem_out_MemData)
1'b0: Write_MEM_Data = Ex_mem_out_data_read2; //sw,sb
1'b1: Write_MEM_Data = Ex_mem_out_data_read3; //swn
endcase
//Next program_counter mux

/*case(Ex_mem_out_jump)
//Choosing between PC+4 and branches
2'b00: begin


else if(OUT_branch_inst == 2'b00) begin
#1 
end

end
Jump instruction
2'b01: PC_in = {PC_4[31:28],address<<2};
//Jump register instruction
2'b10: PC_in = data_out2; to implement 2nd stage
endcase*/
end
endmodule