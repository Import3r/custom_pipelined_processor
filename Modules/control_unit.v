module control_unit(opcode, func, ALUop, RegWrite,branch_inst, RegDest, ALUsrc1,ALUsrc2,jump);
input [5:0] opcode, func;
output reg [2:0] ALUop;
output reg [1:0] RegDest, ALUsrc2,jump;
output reg RegWrite,branch_inst,ALUsrc1;

always @* begin
jump = 2'b00;
RegWrite = 1'b0;
branch_inst = 1'b0;
ALUsrc1 = 1'b1;
if(opcode == 6'h3) begin
ALUop = 3'd0;
ALUsrc2 = 2'b00; //read reg (rt)
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
end
else if (func == 6'h13) begin
//swn
RegWrite = 1'b0;
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
end
else if(opcode == 6'h5 || opcode == 6'h4) begin
//beq+bne
ALUop = 3'd2;
RegWrite = 1'b0;
branch_inst = 1'b1;
ALUsrc2 = 2'b00; //read reg (rt)
end
else if(opcode == 6'h22) begin
//lbu
ALUop = 3'd1;
RegWrite = 1'b1;
RegDest = 2'b00; //rt
ALUsrc2 = 2'b01; //imm
end
else if(opcode == 6'hf) begin
//lui
RegWrite = 1'b1;
RegDest = 2'b00; //rt
end
else if(opcode == 6'h12) begin
//lw
ALUop = 3'd1;
RegWrite = 1'b1;
end
else if(opcode == 6'he) begin
//ori
ALUop = 3'd4;
RegWrite = 1'b1;
RegDest = 2'b00; //rt
ALUsrc2 = 2'b01; //imm
end
else if(opcode == 6'h28) begin
//sb
ALUop = 3'd1;
RegWrite = 1'b0;
ALUsrc2 = 2'b01; //imm
end
else if(opcode == 6'h2b) begin
//sw
ALUop = 3'd1;
RegWrite = 1'b0;
ALUsrc2 = 2'b01; //imm
end
end
endmodule

/*inputs:
	opcode
outputs:
	ALU op
	regwrite*/