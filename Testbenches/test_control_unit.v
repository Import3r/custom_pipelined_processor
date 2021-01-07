module test_control_unit();
reg [5:0] opcode, func;
wire [2:0] ALUop;
wire RegWrite;

initial begin
opcode <= 6'h3; func <= 6'h27;
#25 opcode <= 6'h2b; func <= 6'h0;
#25 opcode <= 6'h7; func <= 6'h0;
#25 $finish;
end

control_unit c1(opcode, func, ALUop, RegWrite);
endmodule