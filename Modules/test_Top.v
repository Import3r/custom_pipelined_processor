module test_Top();
reg [31:0] PC;
reg [31:0] cycle;
initial begin
PC<=32'd240;
cycle <= 1;
end

always @(posedge t1.clk) begin	
	
	if (cycle == 16) begin
	$display("cycle: %d" , cycle);
	$display("PC: %d",t1.PC);
	/*$display("$s5: %d" , t1.main_reg_file.registers_i[23], " The correct value is 20"); //s5
	$display("$s6: %d" , t1.main_reg_file.registers_i[24], " The correct value is 35"); //s6
	$display("$t0: %d" , t1.main_reg_file.registers_i[8], " The correct value is 70"); //t0*/
	//$display("$t9: %d" , t1.main_reg_file.registers_i[17], " The correct value is 33"); //t9
	$display("$t7: %d" , t1.main_reg_file.registers_i[15], " The correct value is 60"); //t7
	$display("Mem_data: %d" , t1.main_data_memory.mem[8], " The correct value is 60"); //t7
		$display("data_out3: %d" , t1.data_out3, " The correct value is 60"); //write_mem_data
				$display("address_Mem_data: %d" , t1.main_data_memory.address, " The correct value is 8"); //address
	$finish;
	end
	cycle = cycle + 1;
end
Top t1(PC);
endmodule
