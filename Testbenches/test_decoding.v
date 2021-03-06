module test_decoding();
wire clk;
reg [31:0] Instruction;
wire [5:0] opcode, funct;
wire [4:0] rs, rt, rd, shamt;
wire [15:0] immediate;
wire [25:0] address;

initial begin
#50 Instruction <= 32'hD4B4820; //R
#100 Instruction <= 32'h254b0028; //I
#100 Instruction <= 32'h08243042; //J
#100 $finish;
end
clock c1(clk);
inst_decoding i1(clk,Instruction, opcode, rs, rt, rd, shamt, funct, immediate, address);
endmodule