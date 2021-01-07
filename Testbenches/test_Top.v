module test_Top();
reg [31:0] PC;
reg [31:0] cycle;
initial begin
PC<=32'd200;
cycle <= 1;
end

always @(posedge t1.clk) begin	
	
	if (cycle == 8) begin
	$display("cycle: %d" , cycle);
	$display("PC: %d",t1.program_counter);
	/*$display("$s5: %d" , t1.main_reg_file.registers_i[23], " The correct value is 20"); //s5
	$display("$s6: %d" , t1.main_reg_file.registers_i[24], " The correct value is 35"); //s6
	$display("$t0: %d" , t1.main_reg_file.registers_i[8], " The correct value is 70"); //t0*/
	$display("instruction: %b" , t1.i1.mem[201]); //t9
	$display("opcode: %b" , t1.opcode, " The correct value is 9"); //t9
	$display("rs: %d" , t1.rs, " The correct value is 0"); //t9
	$display("rt: %d" , t1.rt, " The correct value is 19"); //t9
	$display("immediate: %d" , t1.immediate, " The correct value is 5"); //t9
	//$display("$s1: %d" , t1.regFile.registers_i[19], " The correct value is 60"); //t7
	$finish;
	end
	cycle = cycle + 1;
end
Top t1(PC);
endmodule
