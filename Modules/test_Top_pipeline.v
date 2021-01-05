module test_Top_pipeline(); 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top_pipline top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 228;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin	
#51 /*$display("cycle: %d" , cycle);
$display("PC: %d",top.program_counter);
$display("PC_in %d" , top.IF_ID.PC_4_in, " The correct value is 104");
$display("instruction_in %h" , top.IF_ID.instruction_in, " The correct value is 48080000");
$display("PC_out %d" , top.PC_4_out, " The correct value is 104");
$display("instruction_out %h" , top.instruction_out, " The correct value is 48080000");
$display("************ID-Decoding*************");
$display("opcode %h" , top.opcode);
$display("rs %d" , top.rs);
$display("rt %d" , top.rt);
$display("rd %d" , top.rd);
$display("shamt %d" , top.shamt);
$display("funct %d" , top.funct);
$display("immediate %d" , top.immediate);
$display("address %d" , top.address);
$display("************ID-ControlUnit*************");
$display("ALUop %b" , top.ALUop);
$display("RegWrite %b" , top.RegWrite);
$display("branch_inst %b" , top.branch_inst);
$display("RegDest %b" , top.RegDest);
$display("ALUsrc1 %b" , top.ALUsrc1);
$display("ALUsrc2 %b" , top.ALUsrc2);
$display("jump %b" , top.jump);
$display("zero %b" , top.zero);
$display("RegSrc %b" , top.RegSrc);
$display("word_byte %b" , top.word_byte);
$display("Mem_Write_Read %b" , top.Mem_Write_Read);
$display("reg_2_src %b" , top.reg_2_src);
$display("MemData %b" , top.MemData);
$display("************ID-RegFile*************");
$display("data_out1 %d" , top.data_out1);
$display("data_out2 %d" , top.data_out2);
$display("data_out3 %d" , top.data_out3);
$display("signExtImm %d" , top.signExtImm);
$display("PC_4_out: %d",top.PC_4_out-4);
$display("************ID_EX out*************");
$display("OUT_ALUop %d" , top.OUT_ALUop);
$display("OUT_RegWrite %d" , top.OUT_RegWrite);
$display("OUT_branch_inst %d" , top.OUT_branch_inst);
$display("OUT_RegDest %d" , top.OUT_RegDest);
$display("OUT_ALUsrc1 %d" , top.OUT_ALUsrc1);
$display("OUT_ALUsrc2 %d" , top.OUT_ALUsrc2);
$display("OUT_jump %d" , top.OUT_jump);
$display("OUT_RegSrc %d" , top.OUT_RegSrc);
$display("OUT_word_byte %d" , top.OUT_word_byte);
$display("OUT_Mem_Write_Read %d" , top.OUT_Mem_Write_Read);
$display("OUT_MemData %d" , top.OUT_MemData);
$display("OUT_data_read1 %d" , top.OUT_data_read1);
$display("OUT_data_read2 %d" , top.OUT_data_read2);
$display("OUT_data_read3 %d" , top.OUT_data_read3);
$display("OUT_signExtenImm %d" , top.OUT_signExtenImm);
$display("OUT_PC_out %d" , top.OUT_PC_out);
$display("OUT_rs %d" , top.OUT_rs);
$display("OUT_rt %d" , top.OUT_rt);
$display("OUT_rd %d" , top.OUT_rd);
$display("OUT_funct %d" , top.OUT_funct);
$display("OUT_shamt %d" , top.OUT_shamt);
$display("OUT_address %d" , top.OUT_address);
$display("OUT_immediate %d" , top.OUT_immediate);
$display("OUT_how_many_ops %d" , top.OUT_how_many_ops);
$display("OUT_OP1_src %d" , top.OUT_OP1_src);
$display(" OUT_OP2_src %d" , top. OUT_OP2_src);
$display("OUT_load_signal %d" , top.OUT_load_signal);
$display("OUT_load_useA %d" , top.OUT_load_useA);
$display("OUT_load_useB %d" , top.OUT_load_useB);
$display("************ID_EX out End*************");
//ExE*/
/*$display("ALU_op1 %d" , top.ALU_op1);
$display("ALU_op2 %d" , top.ALU_op2);
$display("ALUcontrol_signal %b" , top.ALUcontrol_signal);
$display("ALUOut_EXEC %d" , top.ALUOut_EXEC);
$display("ZF %b" , top.ZF);*/
//$display("PC_in %d" , top.PC_in);
//$display("Branch address %d" , top.OUT_PC_out+(top.OUT_signExtenImm<<2));
//ex/mem reg
$display("++++++++++++++++++ cycle: %d ++++++++++++++++++" , cycle);
$display("program_counter: %d",top.program_counter);
$display("===========================================");
$display("$t0: %d" , top.regFile.registers_i[8], " The correct value is 2"); //s6
$display("$t1: %d" , top.regFile.registers_i[9], " The correct value is 2"); //s6
$display("$t2: %d" , top.regFile.registers_i[10], " The correct value is 2"); //s6
$display("$t3: %d" , top.regFile.registers_i[11], " The correct value is 26"); //s6
$display("$t4: %d" , top.regFile.registers_i[12], " The correct value is 26"); //s6
/*$display("forwardA %d" , top.forwardA);
$display("forwardB %d" , top.forwardB);
$display("forwardStore %d" , top.forwardStore);*/
/*$display("Ex_mem_out_RegWrite %d" , top.Ex_mem_out_RegWrite);
$display(" Ex_mem_out_write_reg_dest %d" , top. Ex_mem_out_write_reg_dest);
$display(" mem_wb_out_RegWrite %d" , top. mem_wb_out_RegWrite);
$display(" mem_wb_out_write_reg_dest %d" , top. mem_wb_out_write_reg_dest);
$display(" OUT_rs %d" , top. OUT_rs);
$display(" OUT_rt %d" , top. OUT_rt);
$display("OUT_rd %d" , top.OUT_rd);
$display("f1.OP1 %d" , top.f1.OP1);
$display("f1.OP2 %d" , top.f1.OP2);
$display("forwardA %d" , top.forwardA);
$display("forwardB %d" , top.forwardB);
$display("OUT_OP1_src %d" , top.OUT_OP1_src);
$display(" OUT_OP2_src %d" , top. OUT_OP2_src);
$display("Ex_mem_out_OP1_src %d" , top.Ex_mem_out_OP1_src);
$display("Ex_mem_out_OP2_src %d" , top.Ex_mem_out_OP2_src);
$display("OUT_how_many_ops %d" , top.OUT_how_many_ops);
$display("Ex_mem_out_how_many_ops %d" , top.Ex_mem_out_how_many_ops);


//$display("pcSrc %b" , top.pcSrc);
/*$display("Ex_mem_out_branch_inst %d" , top.Ex_mem_out_branch_inst);
$display("Ex_mem_out_RegSrc %d" , top.Ex_mem_out_RegSrc);
$display("Ex_mem_out_Mem_Write_Read %d" , top.Ex_mem_out_Mem_Write_Read);
$display("Ex_mem_out_RegWrite %d" , top.Ex_mem_out_RegWrite);
$display("Ex_mem_out_word_byte %d" , top.Ex_mem_out_word_byte);
$display("Ex_mem_out_MemData %d" , top.Ex_mem_out_MemData);
$display("Ex_mem_out_ZF %d" , top.Ex_mem_out_ZF);
$display("Ex_mem_out_data_read3 %d" , top.Ex_mem_out_data_read3);
$display("Ex_mem_out_branch_address %d" , top.Ex_mem_out_branch_address);
$display("Ex_mem_out_write_reg_dest %d" , top.Ex_mem_out_write_reg_dest);
$display("Ex_mem_out_jump %d" , top.Ex_mem_out_jump);
$display("Read_data %d" , top.Read_data);
$display("mem_wb_out_RegSrc %d" , top.mem_wb_out_RegSrc);
$display("mem_wb_out_RegWrite %d" , top.mem_wb_out_RegWrite);
$display("mem_wb_out_ALUOut_EXEC %d" , top.mem_wb_out_ALUOut_EXEC);
$display("mem_wb_out_write_reg_dest %d" , top.mem_wb_out_write_reg_dest);
$display("mem_wb_out_Mem_dataOut %d" , top.mem_wb_out_Mem_dataOut);
$display("write_data %d" , top.write_data);
$display("mem_wb_out_write_reg_dest %d" , top.mem_wb_out_write_reg_dest);
$display("mem_wb_out_RegWrite %d" , top.mem_wb_out_RegWrite);
$display("OUT_load_signal %d" , top.OUT_load_signal);
$display("rs %d" , top.rs);
$display("rt %d" , top.rt);
$display("rd %d" , top.rd);
$display("how_many_ops %d" , top.how_many_ops);
$display("OUT_rt %d" , top.OUT_rt);
$display("OUT_Mem_Write_Read %d" , top.OUT_Mem_Write_Read);
$display("OP1_src %d" , top.OP1_src);
$display("OP2_src %d" , top.OP2_src);
$display("PC_write %d" , top.PC_write);
$display("IF_ID_write %d" , top.IF_ID_write);
$display("flush %d" , top.flush);
$display("ALUOut_EXEC %b" , top.ALUOut_EXEC);
$display("Ex_mem_out_ALUOut_EXEC %b" , top.Ex_mem_out_ALUOut_EXEC);
$display("ALU_op1 %b" , top.ALU_op1);
$display("ALU_op2 %b" , top.ALU_op2);
$display("OUT_load_useA %d" , top.OUT_load_useA);
$display("OUT_load_useB %d" , top.OUT_load_useB);
$display("Ex_mem_out_load_signal %d" , top.Ex_mem_out_load_signal);
$display("valid_EX_MEM %d" , top.valid_EX_MEM);*/
if (cycle == 8)
begin
/*$display("mem0: %d" , top.main_data_memory.mem[0]);
$display("mem1: %d" , top.main_data_memory.mem[1]);
$display("mem2: %d" , top.main_data_memory.mem[2]);
$display("mem3: %d" , top.main_data_memory.mem[3]); //s6
$display("mem4: %d" , top.main_data_memory.mem[4]);
$display("mem5: %d" , top.main_data_memory.mem[5]);
$display("mem6: %d" , top.main_data_memory.mem[6]);
$display("mem7: %d" , top.main_data_memory.mem[7]); //s6*/
$finish;
end
cycle = cycle + 1;
end
endmodule