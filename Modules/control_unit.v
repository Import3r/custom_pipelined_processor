module control_unit(opcode, func, ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump,zero,RegSrc,word_byte,Mem_Write_Read,Read_reg_2,MemData);
input [5:0] opcode, func;
output reg [2:0] ALUop;
output reg [1:0] RegDest, ALUsrc2,jump,branch_inst,RegSrc,Mem_Write_Read;
output reg RegWrite,ALUsrc1,zero,word_byte,Read_reg_2,MemData;

always @* begin
Read_reg_2 = 1'b0; //rt
Mem_Write_Read = 2'b00;
RegWrite = 1'b0;
branch_inst = 2'b00;
ALUsrc1 = 1'b1;
zero = 1'b0;
RegSrc = 2'b00; //alu
MemData = 1'b0; //sw,sb
jump = 2'b11; //default

if(opcode == 6'h3) begin
ALUop = 3'd0;
ALUsrc2 = 2'b00; //read reg (rt||rd)
ALUsrc1 = 1'b1; //rs
//R-Type
if (func == 6'h8) begin
//jr
RegWrite = 1'b0;
jump = 2'b10;
end
else if (func == 6'h21) begin
//lwn
RegWrite = 1'b1;
RegDest = 2'b00; //rt
word_byte = 1'b0;
Mem_Write_Read = 2'b10;
RegSrc = 2'b01;
Read_reg_2 = 1'b1; //rd
end
else if (func == 6'h13) begin
//swn
RegWrite = 1'b0;
word_byte = 1'b0;
Mem_Write_Read = 2'b01;
Read_reg_2 = 1'b1; //rd
MemData = 1'b1; //rt 
end
else begin
//add,and,nor,or,slt,sltu,sll,srl,sub
RegWrite = 1'b1;
RegDest = 2'b01; //rd
end
end



else if(opcode == 6'h2) begin
//j
RegWrite = 1'b0;
jump = 2'b01;
end
else if(opcode == 6'h7) begin
//jal
RegWrite = 1'b1;
jump = 2'b01;
RegDest = 2'b10; //ra
ALUsrc2 = 2'b10; //pc+8
ALUsrc1 = 1'b0; //$0
ALUop = 3'd1;
end
else if(opcode == 6'h9) begin
//addi
ALUop = 3'd1;
RegWrite = 1'b1;
RegDest = 2'b00; //rt
ALUsrc2 = 2'b01; //imm
end
else if(opcode == 6'hc) begin
//andi
ALUop = 3'd3;
RegWrite = 1'b1;
RegDest = 2'b00; //rt
ALUsrc2 = 2'b01; //imm
zero = 1'b1; //ZeroExtImm
end
else if(opcode == 6'h5) begin
//beq
ALUop = 3'd2;
RegWrite = 1'b0;
branch_inst = 2'b01;//beq
ALUsrc2 = 2'b00; //read reg (rt)
jump = 2'b00;
end
else if(opcode == 6'h4) begin
//bne
ALUop = 3'd2;
RegWrite = 1'b0;
branch_inst = 2'b10;//bne
ALUsrc2 = 2'b00; //read reg (rt)
jump = 2'b00;
end
else if(opcode == 6'h22) begin
//lbu
ALUop = 3'd1;
RegWrite = 1'b1;
RegDest = 2'b00; //rt
word_byte = 1'b1;
Mem_Write_Read = 2'b10;
RegSrc = 2'b01;
ALUsrc1 = 1'b1;
ALUsrc2 = 2'b01;
end
else if(opcode == 6'hf) begin
//lui
RegWrite = 1'b1;
RegDest = 2'b00; //rt
RegSrc = 2'b10; //imm
end
else if(opcode == 6'h12) begin
//lw
ALUsrc1 = 1'b1;
ALUsrc2 = 2'b01;
ALUop = 3'd1;
RegWrite = 1'b1;
word_byte = 1'b0;
Mem_Write_Read = 2'b10;
RegSrc = 2'b01;
RegDest = 2'b00;
end
else if(opcode == 6'he) begin
//ori
ALUop = 3'd4;
RegWrite = 1'b1;
RegDest = 2'b00; //rt
ALUsrc2 = 2'b01; //imm
zero = 1'b1; //ZeroExtImm
end
else if(opcode == 6'h28) begin
//sb
ALUop = 3'd1;
RegWrite = 1'b0;
ALUsrc1 = 1'b1;
ALUsrc2 = 2'b01; //imm
word_byte = 1'b1;
Mem_Write_Read = 2'b01;
end
else if(opcode == 6'h2b) begin
//sw
ALUop = 3'd1;
RegWrite = 1'b0;
ALUsrc1 = 1'b1;
ALUsrc2 = 2'b01; //imm
word_byte = 1'b0;
Mem_Write_Read = 2'b01;
end
end
endmodule

/*inputs:
	opcode
outputs:
	ALU op
	regwrite*/