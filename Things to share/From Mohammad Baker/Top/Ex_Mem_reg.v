module Ex_Mem_reg(wb_in,mem_in,alu_res_in,rt_data_in,dest_in,alu_mem_read_in,alu_mem_write_in,float_in,alu_RegWrite_in,clk,
					wb_out,mem_out,alu_res_out,rt_data_out,dest_out,alu_mem_read_out,alu_mem_write_out,float_out,alu_RegWrite_out);

input [2:0] mem_in ;
input [3:0] wb_in;
input [31:0] rt_data_in;
input [63:0] alu_res_in;
input [4:0] dest_in;
input [1:0] float_in;
input alu_RegWrite_in;
input alu_mem_read_in,alu_mem_write_in,clk;

output reg [2:0]  mem_out ;
output reg [3:0] wb_out;
output reg [31:0] rt_data_out;
output reg [63:0] alu_res_out;
output reg [4:0] dest_out;
output reg [1:0]float_out;
output reg alu_mem_read_out,alu_mem_write_out,alu_RegWrite_out;



always @(posedge clk )
	begin
		wb_out <= wb_in;
		mem_out <=mem_in;
		alu_res_out <= alu_res_in;
		rt_data_out <=rt_data_in;
		dest_out <=dest_in;
		alu_mem_read_out <=alu_mem_read_in;
		float_out <= float_in;
		alu_mem_write_out <=alu_mem_write_in;
		alu_RegWrite_out <= alu_RegWrite_in;



	end


endmodule 