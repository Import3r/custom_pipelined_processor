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
reg [31:0] write_data;
wire [31:0] data_out1, data_out2;
wire [4:0] rs, rt, rd;
wire [4:0] shamt;
wire [31:0] alu_result;
wire [5:0] opcode, funct;
wire [15:0] immediate;
wire [25:0] address;
wire clk,ZF,RegWrite,bransh_inst;
wire [2:0] ALUop;
wire [3:0] ALUcontrol_signal;
reg [31:0] PC_next;

clock c1(clk);
instructionMemory i1(instruction, PC);
inst_decoding i2(clk,instruction, opcode, rs, rt, rd, shamt, funct, immediate, address);
control_unit c2(opcode, funct, ALUop, RegWrite,bransh_inst);
ALUcontrol a1(clk, ALUop, funct,ALUcontrol_signal);

always@(posedge clk) begin
PC_next = PC + 4;
read_reg1<= rs; read_reg2<=rt; write_reg <= 5'd0; write_data<= 32'd0;
#1 if(ZF && bransh_inst) begin
PC_next = PC+4+immediate;
end
#1 read_reg1<=5'd0; read_reg2<=5'd0; write_reg <= rd; write_data<= alu_result;
#1 read_reg1<= rd; read_reg2<=5'd0; write_reg <= 5'd0; write_data<= 32'd0;
#1 result = PC_next;
end

RegisterFile main_reg_file(RegWrite,read_reg1, read_reg2, write_reg, write_data,data_out1, data_out2);
ALU main_ALU(data_out1,data_out2,shamt,ALUcontrol_signal,alu_result,ZF);
endmodule 
