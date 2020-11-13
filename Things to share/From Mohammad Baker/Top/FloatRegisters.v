  module FloatRegisters(readData1,readData2,readRegister1,readRegister2,writeRegister,writeData,regWrite,clk);
input [4:0] readRegister1,readRegister2,writeRegister;
input [63:0] writeData;
input [0:0]regWrite,clk;

output [31:0] readData1,readData2;
reg [31:0]f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,
				f11,f12,f13,f14,f15,f16,f17,f18,
				f19,f20,f21,f22,f23,f24,f25,f26,
				f27,f28,f29,f30,f31;
 reg [31:0] readData1,readData2;

//read op 
always @(negedge clk)
	begin
		case(readRegister1)
		5'h0:  readData1=f0;
		5'h1:  readData1=f1;
		5'h2:  readData1=f2;
		5'h3:  readData1=f3;
		5'h4:  readData1=f4;
		5'h5:  readData1=f5;
		5'h6:  readData1=f6;
		5'h7:  readData1=f7;
		5'h8:  readData1=f8;
		5'h9:  readData1=f9;
		5'hA:  readData1=f10;
		5'hB:  readData1=f11;
		5'hC:  readData1=f12;
		5'hD:  readData1=f13;
		5'hE:  readData1=f14;
		5'hF:  readData1=f15;
		5'h10:  readData1=f16;
		5'h11:  readData1=f17;
		5'h12:  readData1=f18;
		5'h13:  readData1=f19;
		5'h14:  readData1=f20;
		5'h15:  readData1=f21;
		5'h16:  readData1=f22;
		5'h17:  readData1=f23;
		5'h18:  readData1=f24;
		5'h19:  readData1=f25;
		5'h1A:  readData1=f26;
		5'h1B:  readData1=f27;
		5'h1C:  readData1=f28;
		5'h1D:  readData1=f29;
		5'h1E:  readData1=f30;
		5'h1F:  readData1=f31;
		endcase
	case(readRegister2)
		5'h0:  readData1=f0;
		5'h1:  readData2=f1;
		5'h2:  readData2=f2;
		5'h3:  readData2=f3;
		5'h4:  readData2=f4;
		5'h5:  readData2=f5;
		5'h6:  readData2=f6;
		5'h7:  readData2=f7;
		5'h8:  readData2=f8;
		5'h9:  readData2=f9;
		5'hA:  readData2=f10;
		5'hB:  readData2=f11;
		5'hC:  readData2=f12;
		5'hD:  readData2=f13;
		5'hE:  readData2=f14;
		5'hF:  readData2=f15;
		5'h10:  readData2=f16;
		5'h11:  readData2=f17;
		5'h12:  readData2=f18;
		5'h13:  readData2=f19;
		5'h14:  readData2=f20;
		5'h15:  readData2=f21;
		5'h16:  readData2=f22;
		5'h17:  readData2=f23;
		5'h18:  readData2=f24;
		5'h19:  readData2=f25;
		5'h1A:  readData2=f26;
		5'h1B:  readData2=f27;
		5'h1C:  readData2=f28;
		5'h1D:  readData2=f29;
		5'h1E:  readData2=f30;
		5'h1F:  readData2=f31;
		endcase
end
//write op 
always @(posedge clk)
	begin

		if(regWrite==1)
			begin


				case(writeRegister)
					5'h0:  f0=writeData[31:0];
					5'h1:  f1=writeData[31:0];
					5'h2:  f2=writeData[31:0];
					5'h3:  f3=writeData[31:0];
					5'h4:  f4=writeData[31:0];
					5'h5:  f5=writeData[31:0];
					5'h6:  f6=writeData[31:0];
					5'h7:  f7=writeData[31:0];
					5'h8:  f8=writeData[31:0];
					5'h9:  f9=writeData[31:0];
					5'hA:  f10=writeData[31:0];
					5'hB:  f11=writeData[31:0];
					5'hC:  f12=writeData[31:0];
					5'hD:  f13=writeData[31:0];
					5'hE:  f14=writeData[31:0];
					5'hF:  f15=writeData[31:0];
					5'h10: f16=writeData[31:0];
					5'h11: f17=writeData[31:0];
					5'h12: f18=writeData[31:0];
					5'h13: f19=writeData[31:0];
					5'h14: f20=writeData[31:0];
					5'h15: f21=writeData[31:0];
					5'h16: f22=writeData[31:0];
					5'h17: f23=writeData[31:0];
					5'h18: f24=writeData[31:0];
					5'h19: f25=writeData[31:0];
					5'h1A: f26=writeData[31:0];
					5'h1B: f27=writeData[31:0];
					5'h1C: f28=writeData[31:0];
					5'h1D: f29=writeData[31:0];
					5'h1E: f30=writeData[31:0];
					5'h1F: f31=writeData[31:0];
					

				endcase

end

end

initial 
	begin 

		f0=32'h0;
		f1=32'h0;
		f2=32'b11000000011100000000000000000000;
		f3=32'b01000000001000000000000000000000;
		f4=32'h0;
		f5=32'h0;
		f6=32'h0;
		f7=32'h5;
		f8=32'h5;
		f9=32'h5;
		f10=32'h0;
		f11=32'h0;
		f12=32'h1f2f3f4f;
		f13=32'h0;
		f14=32'h0;
		f15=32'h0;
		f16=32'h0;
		f17=32'h1;
		f18=32'h1;
		f19=32'h1;
		f20=32'h0;
		f21=32'h0A;
		f22=32'h0c;
		f23=32'h0;
		f24=32'h0;
		f25=32'h0;
		f26=32'h0;
		f27=32'h0;
		f28=32'h0;
		f29=32'h0;
		f30=32'h0;
		f31=32'h0;
 
 end
 
 endmodule 