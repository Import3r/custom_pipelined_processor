/*
stage1 : instruction fetch (IF)
stage2 : instruction decode and register fetch (ID)
stage3 : execuction stage (EXEC)
stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/

//module Top(PC_VALUE);// testbench holds the PC Value.
module Top(instruction, result, data_out1, data_out2);
input [31:0] instruction; //opcode & func/ EnableWrite & read write regs
output [31:0] result;
reg EnableWrite;
reg [4:0] read_reg1, read_reg2, write_reg;
reg [31:0] write_data;
output [31:0] data_out1, data_out2;
wire [4:0] rs, rt, rd;
assign rs = instruction[25:21];
assign rt = instruction[20:16];
assign rd = instruction[15:11];

always@* begin
/*read_reg1<=rs; read_reg2<=rt; EnableWrite<=1'b1; write_reg <= rs; write_data<= 32'd15;
#25 read_reg1<=rs; read_reg2<=rt; EnableWrite<=1'b1; write_reg <= rt; write_data<= 32'd10;*/
 read_reg1<= rs; read_reg2<=rt; EnableWrite<=1'b0; write_reg <= rd; write_data<= result;
#25 read_reg1<=rs; read_reg2<=rt; EnableWrite<=1'b1; write_reg <= rd; write_data<= result;
end
RegisterFile main_reg_file(EnableWrite,read_reg1, read_reg2, write_reg, write_data,data_out1, data_out2);
ALU main_ALU(instruction,data_out1,data_out2,result);
endmodule 
