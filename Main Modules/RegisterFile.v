//declares a 32x32 register file.
module RegisterFile(clk,EnableWrite,read_reg1, read_reg2,read_reg3, write_reg, write_data,data_out1, data_out2, data_out3);
input [4:0] read_reg1, read_reg2, read_reg3, write_reg;
output[31:0] data_out1, data_out2, data_out3;
input [31:0] write_data;
input EnableWrite,clk;
reg [31:0] registers_i[31:0];
reg [31:0] registers_f[31:0];

initial begin
registers_i[0] = 32'd0;//0
end

assign data_out1 = registers_i[read_reg1];
assign data_out2 = registers_i[read_reg2];
assign data_out3 = registers_i[read_reg3];


always @(posedge clk) begin
#2
if (EnableWrite == 1'b1) begin
registers_i[write_reg] = write_data;
end
registers_i[0] = 32'd0;//0
end
endmodule