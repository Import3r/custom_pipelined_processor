module InstructionMemory(instruction,address);
input [31:0] address;
output [31:0] instruction;
reg [31:0]instruction;
reg [7:0] instMemory [0:1024];
always@(*)
	begin
		instruction[7:0] =instMemory[address];
		instruction[15:8] =instMemory[address+1];
		instruction[23:16] =instMemory[address+2];
		instruction[31:24] =instMemory[address+3];
	end


initial 
	begin 
		instMemory[0]=8'b00000000;
		instMemory[1]=8'b00000000;
		instMemory[2]=8'b00000000;
		instMemory[3]=8'b00000000;





		//add s2,s1,s0
		instMemory[4]=8'h20;
		instMemory[5]=8'ha0;
		instMemory[6]=8'h53;
		instMemory[7]=8'h06;
		
		//sub t2,t1,t0
		instMemory[8]=8'h24;
		instMemory[9]=8'h50;
		instMemory[10]=8'h28;
		instMemory[11]=8'h05;
		
		//andi s5,s4,ff
		instMemory[12]=8'hff;
		instMemory[13]=8'hff;
		instMemory[14]=8'hd7;
		instMemory[15]=8'h32;
		
		
			//stl s7,s6,s5
		instMemory[16] <= 8'h2a;
		instMemory[17] <= 8'hc8;
		instMemory[18] <= 8'hf8;
		instMemory[19] <= 8'h06;
	
	
		//sll t4,t3,zero
		instMemory[20] <= 8'h80;
		instMemory[21] <= 8'h60;
		instMemory[22] <= 8'h60;
		instMemory[23] <= 8'h05;
		
	
//mult zero,vo,v1
      instMemory[24] <= 8'h18;
		instMemory[25] <= 8'h00;
		instMemory[26] <= 8'h43;
		instMemory[27] <= 8'h04;	
    //div zero,a1,a0
      instMemory[28] <= 8'h1a;
		instMemory[29] <= 8'h00;
		instMemory[30] <= 8'ha4;
		instMemory[31] <= 8'h04;	
	
	
	
	
	//mfhi t9,zero,zero
      instMemory[32] <= 8'h10;
		instMemory[33] <= 8'h88;
		instMemory[34] <= 8'h00;
		instMemory[35] <= 8'h04;	
		
		//mflo K1,zero,zero
      instMemory[36] <= 8'h12;
		instMemory[37] <= 8'hd8;
		instMemory[38] <= 8'h00;
		instMemory[39] <= 8'h04;	
		
		//lui s0,zero,1
      instMemory[40] <= 8'h01;
		instMemory[41] <= 8'h00;
		instMemory[42] <= 8'h12;
		instMemory[43] <= 8'h3c;	
		
		//sb v0,8($zero)
      instMemory[44] <= 8'h08;
		instMemory[45] <= 8'h00;
		instMemory[46] <= 8'h02;
		instMemory[47] <= 8'ha0;	
		
			//lw t3 0(t4)
		instMemory[48] <= 8'h00;
		instMemory[49] <= 8'h00;
		instMemory[50] <= 8'h8b;
		instMemory[51] <= 8'h49;
		
		
		
			//lbu v1, 0(0)
		instMemory[52] <= 8'h00;
		instMemory[53] <= 8'h00;
		instMemory[54] <= 8'h03;
		instMemory[55] <= 8'h88;
		
		
		//swn a0,t9,t5
		instMemory[56] <= 8'h13;
		instMemory[57] <= 8'h20;
		instMemory[58] <= 8'h2d;
		instMemory[59] <= 8'h06;
		
		
			//lwn gp,sp,fp
		instMemory[60] <= 8'h21;
		instMemory[61] <= 8'he0;
		instMemory[62] <= 8'hbe;
		instMemory[63] <= 8'h07;
		

		
	
		//lw s1,0(0) 
		instMemory[64] <= 8'h00;
		instMemory[65] <= 8'h00;
		instMemory[66] <= 8'h13;
		instMemory[67] <= 8'h48;
			
		//add s0,s1,s1
		instMemory[68] <= 8'h20;
		instMemory[69] <= 8'h90;
		instMemory[70] <= 8'h73;
		instMemory[71] <= 8'h06;
		
				//sw s0,12(zero)
		instMemory[72] <= 8'h0c;
		instMemory[73] <= 8'h00;
		instMemory[74] <= 8'h12;
		instMemory[75] <= 8'hac;
		
		
		
		//lwc1 f0,0(v0)
		instMemory[76] <= 8'h00;
		instMemory[77] <= 8'h00;
		instMemory[78] <= 8'h40;
		instMemory[79] <= 8'hc4;
		
		
			
		//add.s f4,f3,f2
		instMemory[80] <= 8'h00;
		instMemory[81] <= 8'h19;
		instMemory[82] <= 8'h02;
		instMemory[83] <= 8'h44;
		
	
	
	
		//stl s7,s6,s5
		instMemory[84] <= 8'h2a;
		instMemory[85] <= 8'hc8;
		instMemory[86] <= 8'hf8;
		instMemory[87] <= 8'h06;
		//j 2
		instMemory[88] <= 8'h02;
		instMemory[89] <= 8'h00;
		instMemory[90] <= 8'h00;
		instMemory[91] <= 8'h08;
	
	   //jr k0
		instMemory[92] <= 8'h08;
		instMemory[93] <= 8'h00;
		instMemory[94] <= 8'h40;
		instMemory[95] <= 8'h07;
	//jal 0 
		instMemory[96] <= 8'h00;
		instMemory[97] <= 8'h00;
		instMemory[98] <= 8'h00;
		instMemory[99] <= 8'h0c;
	
	
	  //beq z0,z0,0
	   instMemory[100] <= 8'h00;
		instMemory[101] <= 8'h00;
		instMemory[102] <= 8'h00;
		instMemory[103] <= 8'h14;
	  // beq zero,zero, -4 
		instMemory[104] <= 8'hfc;
		instMemory[105] <= 8'hff;
		instMemory[106] <= 8'h00;
		instMemory[107] <= 8'h14;
	
	
	
     //bneq z0,z0,0
	   instMemory[108] <= 8'h00;
		instMemory[109] <= 8'h00;
		instMemory[110] <= 8'h00;
		instMemory[111] <= 8'h10;
		
		
     //addi a0,a1,05
	   instMemory[112] <= 8'h05;
		instMemory[113] <= 8'h00;
		instMemory[114] <= 8'ha4;
		instMemory[115] <= 8'h24;
			
     //beq a0,a1,0
	   instMemory[116] <= 8'h00;
		instMemory[117] <= 8'h00;
		instMemory[118] <= 8'ha2;
		instMemory[119] <= 8'h14;
		
		//bne a0,a1,5
	   instMemory[120] <= 8'h05;
		instMemory[121] <= 8'h00;
		instMemory[122] <= 8'ha2;
		instMemory[123] <= 8'h10;
		
		
		
/*
		//lw t3 0(t4)
		instMemory[16] <= 8'h00;
		instMemory[17] <= 8'h00;
		instMemory[18] <= 8'h8b;
		instMemory[19] <= 8'h49;
		
		//sw t5 4(t6)
		instMemory[20] <= 8'h04;
		instMemory[21] <= 8'h00;
		instMemory[22] <= 8'hCD;
		instMemory[23] <= 8'hAD;
		
		
		//lw s1 4(zero)
		instMemory[24] <=8'h04;
		instMemory[25] <= 8'h00;
		instMemory[26] <= 8'h13;
		instMemory[27] <= 8'h48;

		instMemory[28] <= 'hff;
		instMemory[29] <= 'hff;
		instMemory[30] <= 'h62;
		instMemory[31] <= 'h3c;
		
	*/
	
	

	end


endmodule 