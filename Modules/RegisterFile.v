//declares a 32x32 register file.
module RegisterFile(EnableWrite,read_reg1, read_reg2, write_reg, write_data,data_out1, data_out2);
	// this module is not complete ... you should use these names to declare the register file unit 
input [4:0] read_reg1, read_reg2, write_reg;
output reg [31:0] data_out1, data_out2;
input [31:0] write_data;
input EnableWrite;
reg [31:0] registers_i[31:0];
reg [31:0] registers_f[31:0];

always @* begin
/*registers_i[10] = 32'd15;
registers_i[11] = 32'd10;*/
if (EnableWrite == 1'b1) begin
registers_i[write_reg] = write_data;
end
else if (EnableWrite == 1'b0) begin
data_out1 = registers_i[read_reg1];
data_out2 = registers_i[read_reg2];
end
end
endmodule