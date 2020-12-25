module test_mem();
reg [31:0] Address,write_data;
reg [1:0] Mem_Write_Read;
wire clk;
reg word_byte;
wire[31:0] Read_data;

initial begin
Address<= 32'd0; write_data <= 32'd0; Mem_Write_Read <= 2'b10; word_byte <= 1'b0;
#100 Address<= 32'd0; write_data <= 32'd0; Mem_Write_Read <= 2'b10; word_byte <= 1'b1;
#100 Address<= 32'd3; write_data <= 32'd0; Mem_Write_Read <= 2'b10; word_byte <= 1'b1;
#100 Address<= 32'd4; write_data <= 32'd100; Mem_Write_Read <= 2'b01; word_byte <= 1'b1;
#100 Address<= 32'd4; write_data <= 32'd0; Mem_Write_Read <= 2'b10; word_byte <= 1'b1;
#100 Address<= 32'd4; write_data <= 32'd0; Mem_Write_Read <= 2'b10; word_byte <= 1'b0;
#100 $finish;
end

clock c2(clk);
DataMemory c1(clk,Address,write_data,Mem_Write_Read,Read_data,word_byte);
endmodule