/*
stage1 : instruction fetch (IF)
stage2 : instruction decode and register fetch (ID)
stage3 : execuction stage (EXEC)
stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/

//module Top(PC_VALUE);// testbench holds the PC Value.
module Top(PC, result);
input [31:0] PC;
wire [31:0] instruction; //opcode & func/ EnableWrite & read write regs
output reg [31:0] result;
reg [4:0] read_reg1, read_reg2, write_reg;
reg [31:0] write_data,ALU_op2;
wire [31:0] data_out1, data_out2;
wire [4:0] rs, rt, rd;
wire [4:0] shamt;
wire [31:0] alu_result;
wire [5:0] opcode, funct;
wire [15:0] immediate;
wire [25:0] address;
wire clk,ZF,RegWrite,branch_inst,RegDest, ALUsrc;
wire [2:0] ALUop;
wire [3:0] ALUcontrol_signal;

clock c1(clk);
instructionMemory i1(instruction, PC);//IF
inst_decoding i2(clk,instruction, opcode, rs, rt, rd, shamt, funct, immediate, address); //ID
control_unit c2(opcode, funct, ALUop, RegWrite,branch_inst,RegDest, ALUsrc);
ALUcontrol a1(ALUop, funct,ALUcontrol_signal);
RegisterFile main_reg_file(clk,RegWrite,rs, rt, write_reg, alu_result,data_out1, data_out2);
ALU main_ALU(clk,data_out1,ALU_op2,shamt,ALUcontrol_signal,alu_result,ZF); //EXEC

always@(posedge clk) begin
read_reg1 = 0;
read_reg2 = 0;
write_reg = 0;
write_data = 0;
ALU_op2 = 0;
case(RegDest)
1'b0: write_reg = rt;
1'b1: write_reg = rd;
endcase
case (ALUsrc)
1'b0: ALU_op2 = data_out2;
1'b1: ALU_op2 = data_out2;//signExtImm(CHANGE THIS)
endcase
result <= alu_result;
end
endmodule 
