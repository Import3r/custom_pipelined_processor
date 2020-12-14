module test_reg_file();
reg [4:0] read_reg1,read_reg2,write_reg;
reg [31:0] write_data;
reg EnableWrite;
wire [31:0] data_out1,data_out2;

initial begin
read_reg1<=32'd0; read_reg2<=32'd0; EnableWrite<=1'b1; write_reg <= 32'd8; write_data<= 32'd90;
#25 read_reg1<=32'd8; read_reg2<=32'd0; EnableWrite<=1'b0; write_reg <= 32'd0; write_data<= 32'd0;
#25 read_reg1<=32'd0; read_reg2<=32'd0; EnableWrite<=1'b0; write_reg <= 32'd8; write_data<= 32'd45;
#25 read_reg1<=32'd8; read_reg2<=32'd0; EnableWrite<=1'b0; write_reg <= 32'd0; write_data<= 32'd0;
#25 $finish;
end

RegisterFile r1(EnableWrite,read_reg1, read_reg2, write_reg, write_data,data_out1, data_out2);
endmodule