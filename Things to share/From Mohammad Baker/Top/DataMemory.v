module DataMemory(readData,address,writeData,memoryWrite,memoryRead,memDataSize,clk);
output [31:0]readData;
reg [31:0]readData;
input [31:0]address;
input[31:0] writeData;
input  memDataSize;
input memoryRead,memoryWrite,clk;
reg [7:0] dataMem [0:1024];
always @(*)
	begin
		case(memDataSize)
//32 bit 
1'b0:
	if(memoryWrite==1)
		begin 

			dataMem[address]=writeData[7:0];
			dataMem[address+1]=writeData[15:8];
			dataMem[address+2]=writeData[23:16];
			dataMem[address+3]=writeData[31:24];


		end

	else if(memoryRead==1)

			begin 

			readData[7:0]=dataMem[address];
			readData[15:8]=dataMem[address+1];
			readData[23:16]=dataMem[address+2];
			readData[31:24]=dataMem[address+3];


			end






//8 bit 
1'b1:
		if(memoryWrite==1)
			dataMem[address]=writeData[7:0];

		else if(memoryRead==1)
			readData={24'h000000,dataMem[address]};

	endcase

end

initial 
	begin 
		dataMem[0]=8'h2f;
		dataMem[1]=8'h3f;
		dataMem[2]=8'h4f;
		dataMem[3]=8'h5f;
		
		dataMem[4]=8'h0;
		dataMem[5]=8'h0;
		dataMem[6]=8'h0;
		dataMem[7]=8'h0;
		
		 
		dataMem[8]=8'h0;
		dataMem[9]=8'h0;
		dataMem[10]=8'h0;
		dataMem[11]=8'h0;
		
		dataMem[12]=8'h0;
		dataMem[13]=8'h0;
		dataMem[14]=8'h0;
		dataMem[15]=8'h0;


	end


endmodule 