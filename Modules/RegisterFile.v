//declares a 32x32 register file.
module RegisterFile(clk,EnableWrite,read_reg1, read_reg2,read_reg3, write_reg, write_data,data_out1, data_out2, data_out3);
	// this module is not complete ... you should use these names to declare the register file unit 
input [4:0] read_reg1, read_reg2, read_reg3, write_reg;
output reg [31:0] data_out1, data_out2, data_out3;
input [31:0] write_data;
input EnableWrite,clk;
reg [31:0] registers_i[31:0];
reg [31:0] registers_f[31:0];

always @(negedge clk) begin
registers_i[0] = 32'd0;//0
registers_i[9] = 32'd4;//t1
registers_i[10] = 32'd562;//t2
/*registers_i[10] = 32'd60;//t2
registers_i[16] = 32'd232;//t8
registers_i[19] = 32'd99;//s1
registers_i[20] = 32'd7;//s2
registers_i[21] = 32'd40;//s3*/
//else if (EnableWrite == 1'b0) begin
data_out1 = registers_i[read_reg1];
data_out2 = registers_i[read_reg2];
data_out3 = registers_i[read_reg3];
//end
end

always @(posedge clk) begin
#2
if (EnableWrite == 1'b1) begin
registers_i[write_reg] = write_data;
end
end
endmodule