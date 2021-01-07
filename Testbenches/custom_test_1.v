module custom_test_1(); 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 696;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin
	
	if (cycle == 28)
begin
$display("$t0: %d" , top.regFile.registers_i[8], " The correct value is 2");
$display("$t1: %d" , top.regFile.registers_i[9], " The correct value is 2");
$display("$t2: %d" , top.regFile.registers_i[10], " The correct value is 2");
$display("$t3: %d" , top.regFile.registers_i[11], " The correct value is 26");
$display("$t4: %d" , top.regFile.registers_i[12], " The correct value is 26");
$finish;
end
cycle = cycle + 1;
end
	endmodule