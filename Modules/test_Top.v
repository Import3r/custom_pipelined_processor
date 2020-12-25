module test_Top();
reg [31:0] PC;
reg [31:0] cycle;
initial begin
PC<=32'd240;
cycle <= 1;
end

always @(posedge t1.clk) begin	
	
	if (cycle == 12) begin
	$display("cycle: %d" , cycle);
	$display("PC: %d",t1.PC);
	/*$display("$s5: %d" , t1.main_reg_file.registers_i[23], " The correct value is 20"); //s5
	$display("$s6: %d" , t1.main_reg_file.registers_i[24], " The correct value is 35"); //s6
	$display("$t0: %d" , t1.main_reg_file.registers_i[8], " The correct value is 70"); //t0*/
	//$display("$t9: %d" , t1.main_reg_file.registers_i[17], " The correct value is 33"); //t9
	$display("$t7: %d" , t1.main_reg_file.registers_i[15], " The correct value is 4"); //t7
	$display("wr reg: %d" , t1.main_reg_file.write_reg, " The correct value is 15"); //alu
	$display("wr data: %d" , t1.main_reg_file.write_data, " The correct value is 4"); //alu
	$finish;
	end
	cycle = cycle + 1;
end
Top t1(PC);
endmodule
