module ALUcontrol(ALUop, func,ALUcontrol_signal);
input [2:0] ALUop;
input [5:0] func;
output reg [3:0] ALUcontrol_signal;

always @* begin
case(ALUop)
3'd0: begin
//R-Type
case(func)
6'h20: ALUcontrol_signal = 4'd0; //add
6'h14: ALUcontrol_signal = 4'd1;//and
6'h21: ALUcontrol_signal = 4'd0;//lwn
6'h27: ALUcontrol_signal = 4'd2;//nor
6'h25: ALUcontrol_signal = 4'd3;//or
6'h2a: ALUcontrol_signal = 4'd4;//slt
6'h2b: ALUcontrol_signal = 4'd5;//sltu
6'h00: ALUcontrol_signal = 4'd6;//sll
6'h02: ALUcontrol_signal = 4'd7;//srl
6'h13: ALUcontrol_signal = 4'd0;//swn
6'h24: ALUcontrol_signal = 4'd8;//sub
endcase
end
3'd1: ALUcontrol_signal = 4'd0; //addi+lbu+sb+sw+lw -> add
3'd2: ALUcontrol_signal = 4'd8;//beq+bne -> sub
3'd3: ALUcontrol_signal = 4'd1;//andi -> and
3'd4: ALUcontrol_signal = 4'd3;//ori -> or
endcase
end
endmodule
/*
Aluop for R 00
addi -> add(rs,imm)
lbu/lw/sb/sw -> add(rs,imm)

andi -> and(rs, imm)

beq -> sub(rs,rt)
bnq -> sub(rs,rt)

ori -> or(rs, imm)

R-Type{
add(rs,rt)
and(rs,rt)
lwn add(rs,rd)
nor(rs,rt)
or (rs,rt)
slt (rs,rt)
sltu (rs,rt)
sll (rt)
srl (rt)
swn add(rs,rd)
sub (rs,rt)
}*/