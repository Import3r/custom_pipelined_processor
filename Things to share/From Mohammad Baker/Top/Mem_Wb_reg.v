module Mem_Wb_reg(wb_in,mem_data_in,alu_res_in,dest_in,float_in,alu_mem_read_in,alu_RegWrite_in,clk,wb_out,mem_data_out,dest_out,alu_res_out,float_out,alu_mem_read_out,alu_RegWrite_out);

input [3:0]wb_in;
input [31:0] mem_data_in;
input [63:0] alu_res_in;
input [4:0] dest_in;
input [1:0] float_in;
input alu_mem_read_in,alu_RegWrite_in;
input clk ;

output reg [3:0]wb_out;
output reg [31:0] mem_data_out;
output reg [63:0] alu_res_out;
output reg [4:0] dest_out; 
output reg [1:0] float_out;
output reg alu_mem_read_out,alu_RegWrite_out;
always @(posedge clk)
	begin
		wb_out <= wb_in;
		mem_data_out <= mem_data_in;
		dest_out <= dest_in;
		alu_res_out <= alu_res_in;
		float_out<=float_in;
		alu_mem_read_out <=alu_mem_read_in;
		alu_RegWrite_out<=alu_RegWrite_in;
	
	end


endmodule 