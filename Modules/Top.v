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
wire [31:0] instruction, PC; //opcode & func/ EnableWrite & read write regs
reg [4:0] read_reg1, read_reg2, write_reg;
reg [31:0] write_data,ALU_op1,ALU_op2,PC_in,PC_4;
wire [31:0] data_out1, data_out2;
wire [4:0] rs, rt, rd;
wire [4:0] shamt;
wire [31:0] alu_result,signExtImm;
wire [5:0] opcode, funct;
wire [15:0] immediate;
wire [25:0] address;
wire clk,ZF,RegWrite,ALUsrc1,zero;
wire [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc;
wire [2:0] ALUop;
wire [3:0] ALUcontrol_signal;

clock c1(clk);
PC_module main_PC(clk,PC_in,PC_initial, PC);
instructionMemory i1(instruction, PC);//IF
inst_decoding i2(clk,instruction, opcode, rs, rt, rd, shamt, funct, immediate, address); //ID
control_unit c2(opcode, funct, ALUop, RegWrite,branch_inst,RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc);
ALUcontrol a1(ALUop, funct,ALUcontrol_signal);
RegisterFile main_reg_file(clk,RegWrite,rs, rt, write_reg, write_data,data_out1, data_out2);
ALU main_ALU(clk,ALU_op1,ALU_op2,shamt,ALUcontrol_signal,alu_result,ZF); //EXEC
sign_extend s1(immediate,signExtImm,zero);
always@(posedge clk) begin
read_reg1 = 0;
read_reg2 = 0;
write_reg = 0;
write_data = 0;
ALU_op2 = 0;
case(RegDest)
2'b00: write_reg = rt;
2'b01: write_reg = rd;
2'b10: write_reg = 5'd31; //ra
endcase
case (ALUsrc2)
2'b00: ALU_op2 = data_out2;
2'b01: ALU_op2 = signExtImm;
2'b10: ALU_op2 = PC+8;
endcase
case (ALUsrc1)
1'b0: ALU_op1 = 5'd0;//$0
1'b1: ALU_op1 = data_out1;
endcase
case(RegSrc)
2'b00: write_data = alu_result;//alu_result
2'b01: write_data = alu_result;//Mem
2'b10: write_data = {immediate, 16'b0};//lui
endcase
PC_4 = PC+4;
case(jump)
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
2'b01: PC_in = {PC_4[31:28],address<<2};
2'b10: PC_in = data_out2;
endcase
end
endmodule 
