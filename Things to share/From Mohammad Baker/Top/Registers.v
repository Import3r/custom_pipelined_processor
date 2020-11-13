module Registers(readData1,readData2,readData3,readRegister1,readRegister2,readRegister3,writeRegister,writeData,regWrite,clk,float);
input [4:0] readRegister1,readRegister2,readRegister3,writeRegister;
input [63:0] writeData;
input [0:0]regWrite,clk;
input [1:0] float;
output [31:0] readData1,readData2,readData3;
reg [31:0]zero,at,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6,
			  t7,t8,t9,s0,s1,s2,s3,s4,s5,s6,s7,k0,k1,gp,sp,fp,
			  ra,hi,lo;
reg [31:0] readData1,readData2,readData3;




//read op 
always @(negedge clk)
begin
		case(readRegister1)
		5'h0:  readData1=zero;
		5'h1:  readData1=at;
		5'h2:  readData1=v0;
		5'h3:  readData1=v1;
		5'h4:  readData1=a0;
		5'h5:  readData1=a1;
		5'h6:  readData1=a2;
		5'h7:  readData1=a3;
		5'h8:  readData1=t0;
		5'h9:  readData1=t1;
		5'hA:  readData1=t2;
		5'hB:  readData1=t3;
		5'hC:  readData1=t4;
		5'hD:  readData1=t5;
		5'hE:  readData1=t6;
		5'hF:  readData1=t7;
		5'h10:  readData1=t8;
		5'h11:  readData1=t9;
		5'h12:  readData1=s0;
		5'h13:  readData1=s1;
		5'h14:  readData1=s2;
		5'h15:  readData1=s3;
		5'h16:  readData1=s4;
		5'h17:  readData1=s5;
		5'h18:  readData1=s6;
		5'h19:  readData1=s7;
		5'h1A:  readData1=k0;
		5'h1B:  readData1=k1;
		5'h1C:  readData1=gp;
		5'h1D:  readData1=sp;
		5'h1E:  readData1=fp;
		5'h1F:  readData1=ra;
		endcase
	case(readRegister2)
		5'h0:  readData2=zero;
		5'h1:  readData2=at;
		5'h2:  readData2=v0;
		5'h3:  readData2=v1;
		5'h4:  readData2=a0;
		5'h5:  readData2=a1;
		5'h6:  readData2=a2;
		5'h7:  readData2=a3;
		5'h8:  readData2=t0;
		5'h9:  readData2=t1;
		5'hA:  readData2=t2;
		5'hB:  readData2=t3;
		5'hC:  readData2=t4;
		5'hD:  readData2=t5;
		5'hE:  readData2=t6;
		5'hF:  readData2=t7;
		5'h10:  readData2=t8;
		5'h11:  readData2=t9;
		5'h12:  readData2=s0;
		5'h13:  readData2=s1;
		5'h14:  readData2=s2;
		5'h15:  readData2=s3;
		5'h16:  readData2=s4;
		5'h17:  readData2=s5;
		5'h18:  readData2=s6;
		5'h19:  readData2=s7;
		5'h1A:  readData2=k0;
		5'h1B:  readData2=k1;
		5'h1C:  readData2=gp;
		5'h1D:  readData2=sp;
		5'h1E:  readData2=fp;
		5'h1F:  readData2=ra;
		endcase

	case(readRegister3)
		5'h0:  readData3=zero;
		5'h1:  readData3=at;
		5'h2:  readData3=v0;
		5'h3:  readData3=v1;
		5'h4:  readData3=a0;
		5'h5:  readData3=a1;
		5'h6:  readData3=a2;
		5'h7:  readData3=a3;
		5'h8:  readData3=t0;
		5'h9:  readData3=t1;
		5'hA:  readData3=t2;
		5'hB:  readData3=t3;
		5'hC:  readData3=t4;
		5'hD:  readData3=t5;
		5'hE:  readData3=t6;
		5'hF:  readData3=t7;
		5'h10:  readData3=t8;
		5'h11:  readData3=t9;
		5'h12:  readData3=s0;
		5'h13:  readData3=s1;
		5'h14:  readData3=s2;
		5'h15:  readData3=s3;
		5'h16:  readData3=s4;
		5'h17:  readData3=s5;
		5'h18:  readData3=s6;
		5'h19:  readData3=s7;
		5'h1A:  readData3=k0;
		5'h1B:  readData3=k1;
		5'h1C:  readData3=gp;
		5'h1D:  readData3=sp;
		5'h1E:  readData3=fp;
		5'h1F:  readData3=ra;
		endcase

end

//write op 
always @(posedge clk)
begin





if(regWrite==1  )
begin
//normal
if(float==2'b00)
	case(writeRegister)
		5'h1:  at=writeData[31:0];
		5'h2:  v0=writeData[31:0];
		5'h3:  v1=writeData[31:0];
		5'h4:  a0=writeData[31:0];
		5'h5:  a1=writeData[31:0];
		5'h6:  a2=writeData[31:0];
		5'h7:  a3=writeData[31:0];
		5'h8:  t0=writeData[31:0];
		5'h9:  t1=writeData[31:0];
		5'hA:  t2=writeData[31:0];
		5'hB:  t3=writeData[31:0];
		5'hC:  t4=writeData[31:0];
		5'hD:  t5=writeData[31:0];
		5'hE:  t6=writeData[31:0];
		5'hF:  t7=writeData[31:0];
		5'h10:  t8=writeData[31:0];
		5'h11:  t9=writeData[31:0];
		5'h12:  s0=writeData[31:0];
		5'h13:  s1=writeData[31:0];
		5'h14:  s2=writeData[31:0];
		5'h15:  s3=writeData[31:0];
		5'h16:  s4=writeData[31:0];
		5'h17:  s5=writeData[31:0];
		5'h18:  s6=writeData[31:0];
		5'h19:  s7=writeData[31:0];
		5'h1A:  k0=writeData[31:0];
		5'h1B:  k1=writeData[31:0];
		5'h1C:  gp=writeData[31:0];
		5'h1D:  sp=writeData[31:0];
		5'h1E:  fp=writeData[31:0];
		5'h1F:  ra=writeData[31:0];


	endcase
//move from high
 if(float==2'b01)
	case(writeRegister)
		5'h1:  at=hi;
		5'h2:  v0=hi;
		5'h3:  v1=hi;
		5'h4:  a0=hi;
		5'h5:  a1=hi;
		5'h6:  a2=hi;
		5'h7:  a3=hi;
		5'h8:  t0=hi;
		5'h9:  t1=hi;
		5'hA:  t2=hi;
		5'hB:  t3=hi;
		5'hC:  t4=hi;
		5'hD:  t5=hi;
		5'hE:  t6=hi;
		5'hF:  t7=hi;
		5'h10:  t8=hi;
		5'h11:  t9=hi;
		5'h12:  s0=hi;
		5'h13:  s1=hi;
		5'h14:  s2=hi;
		5'h15:  s3=hi;
		5'h16:  s4=hi;
		5'h17:  s5=hi;
		5'h18:  s6=hi;
		5'h19:  s7=hi;
		5'h1A:  k0=hi;
		5'h1B:  k1=hi;
		5'h1C:  gp=hi;
		5'h1D:  sp=hi;
		5'h1E:  fp=hi;
		5'h1F:  ra=hi;


	endcase
//move from low
 if(float==2'b10)
	case(writeRegister)
		5'h1:   at=lo;
		5'h2:   v0=lo;
		5'h3:   v1=lo;
		5'h4:   a0=lo;
		5'h5:   a1=lo;
		5'h6:   a2=lo;
		5'h7:   a3=lo;
		5'h8:   t0=lo;
		5'h9:   t1=lo;
		5'hA:   t2=lo;
		5'hB:   t3=lo;
		5'hC:   t4=lo;
		5'hD:   t5=lo;
		5'hE:   t6=lo;
		5'hF:   t7=lo;
		5'h10:  t8=hi;
		5'h11:  t9=lo;
		5'h12:  s0=lo;
		5'h13:  s1=lo;
		5'h14:  s2=lo;
		5'h15:  s3=lo;
		5'h16:  s4=lo;
		5'h17:  s5=lo;
		5'h18:  s6=lo;
		5'h19:  s7=lo;
		5'h1A:  k0=lo;
		5'h1B:  k1=lo;
		5'h1C:  gp=lo;
		5'h1D:  sp=lo;
		5'h1E:  fp=lo;
		5'h1F:  ra=lo;


	endcase


//mult divide
 if(float==2'b11)
	begin 
		hi=writeData[63:32];
		lo=writeData[31:0];



	end

end

end

initial begin 

		at=32'h0;
		v0=32'h2;
		v1=32'h3;
		a0=32'h3;
		a1=32'ha;
		a2=32'h0;
		a3=32'h0;
		t0=32'h5;
		t1=32'h5;
		t2=32'h5;
		t3=32'h2;
		t4=32'h0;
		t5=32'h1f2f3f4f;
		t6=32'h0;
		t7=32'h0;
		t8=32'h0;
		t9=32'h0;
		s0=32'h1;
		s1=32'h1;
		s2=32'h1;
		s3=32'h0;
		s4=32'h0A;
		s5=32'h02;
		s6=32'h1;
		s7=32'h5;
		k0=32'h4;
		k1=32'h0;
		gp=32'h0;
		sp=32'h0;
		fp=32'h0;
		ra=32'h0;
		zero=32'h0;
		hi=3'h0;
		lo=32'h0;
 
 end
 
 endmodule 