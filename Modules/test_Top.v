module test_Top();
reg [31:0] instruction;
wire [31:0] result, data_out1,data_out2;

initial begin
instruction<=32'hD4B4820;
#100 instruction<=32'hD4B4824;
#100 $finish;
end

Top t1(instruction, result, data_out1,data_out2);
endmodule
