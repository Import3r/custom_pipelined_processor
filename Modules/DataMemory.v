module DataMemory(clk,address,write_data,Mem_Write_Read,Read_data,word_byte);
input [31:0] address,write_data;
input [1:0] Mem_Write_Read;
input clk,word_byte;
output reg[31:0] Read_data;

	// Intitialization for the memory 
	//reg [7:0] mem [1023:0]; // building a 1k memory //
	reg [7:0] mem [31:0]; // building a 32 memory //
	integer i;
	
	initial
		begin
	/*mem[3] 	= 4;
	mem[7] 	= 8;
	mem[11] 	= 12;
	mem[15] 	= 16;
	mem[19] 	= 20;
	mem[23] 	= 24;
	mem[27] 	= 28;
	mem[31] 	= 32;*/
			for(i = 0; i <32; i = i + 1)
				begin
					mem[i] <=  0;
					if((i+1)%4 == 0)
					mem[i] <= i+1;
				end
		end
//Read data
always @(negedge clk) begin
if(Mem_Write_Read == 2'b10) begin
case(word_byte)
//load word
1'b0: begin
Read_data[31:24] = mem[address[9:0]];
Read_data[23:16] = mem[address[9:0]+1];
Read_data[15:8] = mem[address[9:0]+2];
Read_data[7:0] = mem[address[9:0]+3];
end
//load byte
1'b1: begin
Read_data = mem[address[9:0]];
end
endcase
end
end

//Write data
always @(posedge clk) begin
if(Mem_Write_Read == 2'b01) begin
case(word_byte)
//store word
1'b0: begin
mem[address[9:0]] = write_data[31:24];
mem[address[9:0]+1] = write_data[23:16];
mem[address[9:0]+2] = write_data[15:8];
mem[address[9:0]+3] = write_data[7:0];
end
//store byte
1'b1: begin
mem[address[9:0]] = write_data;
end
endcase
end
end
endmodule