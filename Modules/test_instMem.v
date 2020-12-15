module test_instMem();
reg [31:0] PC;
wire [31:0] instruction;

initial begin
PC <= 32'd108;
#25 $finish;
end
instructionMemory i1(instruction, PC);
endmodule