/*
stage1 : instruction fetch (IF)
stage2 : instruction decode and register fetch (ID)
stage3 : execuction stage (EXEC)
stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/

//module Top(PC_VALUE);// testbench holds the PC Value.
module Top(PC_initial);
input [31:0] PC_initial;
wire [31:0] instruction, program_counter; //opcode & func/ EnableWrite & read write regs
reg [4:0] write_reg,ReadReg2;
reg [31:0] write_data,ALU_op1,ALU_op2,PC_in,PC_4,Write_MEM_Data;
wire [31:0] data_out1, data_out2,Read_data,data_out3;
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

clock c1(clk);
PC_module main_PC(clk,PC_in,PC_initial, program_counter);
instructionMemory i1(instruction, program_counter);//IF
inst_decoding i2(clk,instruction, opcode, rs, rt, rd, shamt, funct, immediate, address); //ID
control_unit c2(opcode, funct, ALUop, RegWrite,branch_inst,RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,reg_2_src,MemData);
ALUcontrol a1(ALUop, funct,ALUcontrol_signal);
RegisterFile regFile(clk,RegWrite,rs, ReadReg2,rt, write_reg, write_data,data_out1, data_out2,data_out3);
ALU main_ALU(clk,ALU_op1,ALU_op2,shamt,ALUcontrol_signal,ALUOut_EXEC,ZF); //EXEC
sign_extend s1(immediate,signExtImm,zero);
DataMemory main_data_memory(clk,ALUOut_EXEC,Write_MEM_Data,Mem_Write_Read,Read_data,word_byte);
always@(posedge clk) begin
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

//ALU sources muxes
case (ALUsrc2)
2'b00: ALU_op2 = data_out2; //rt||rd
2'b01: ALU_op2 = signExtImm; //imm
2'b10: ALU_op2 = program_counter+8; //PC+8
endcase
case (ALUsrc1)
1'b0: ALU_op1 = 5'd0;//$0
1'b1: ALU_op1 = data_out1;
endcase

//Register source mux
case(RegSrc)
2'b00: write_data = ALUOut_EXEC;//ALUOut_EXEC
2'b01: write_data = Read_data;//Mem
2'b10: write_data = {immediate, 16'b0};//lui
endcase

//Next program_counter mux
PC_4 = program_counter+4;
case(jump)
//Choosing between PC+4 and branches
2'b00: begin
if(branch_inst == 2'b01) begin
if(ZF) PC_in = PC_4+(signExtImm<<2);//beq
else PC_in = PC_4;
end

else if(branch_inst == 2'b10) begin
if(!ZF) PC_in = PC_4+(signExtImm<<2);//bne
else PC_in = PC_4;
end

else if(branch_inst == 2'b00) begin
PC_in = PC_4;
end

end
//Jump instruction
2'b01: PC_in = {PC_4[31:28],address<<2};
//Jump register instruction
2'b10: PC_in = data_out2;
endcase

case(MemData)
1'b0: Write_MEM_Data = data_out2; //sw,sb
1'b1: Write_MEM_Data = data_out3; //swn
endcase
end

endmodule 
