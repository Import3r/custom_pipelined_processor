module test_Top();
reg [31:0] PC;
wire [31:0] result;
reg [31:0] cycle;
initial begin
PC<=32'd216;
cycle <= 1;
end

always @(posedge t1.clk) begin	
	
	if (cycle == 6) begin
	$display("cycle: %d" , cycle);
	$display("PC: %d",t1.PC);
	$display("$s5: %d" , t1.main_reg_file.registers_i[23], " The correct value is 20"); //s5
	PC<=32'd220;
	end
	if (cycle == 12) begin
	$display("cycle: %d" , cycle);
	$display("PC: %d",t1.PC);
	$display("$s5: %d" , t1.main_reg_file.registers_i[24], " The correct value is 35"); //s6
	$finish;
	end
	cycle = cycle + 1;
end
Top t1(PC, result);
endmodule
