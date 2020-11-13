module controlUnit(flush,RegDst,ALUOp, ALUSrc, Branch,BranchNotEqual,Jmp,JmpLink,Signed, MemRead, MemWrite, RegWrite, MemToReg,MemDataSize,floatRegWrite,floatMux,op_code,id_rs,id_rt,id_rd,ex_rd,ex_rt,ex_memRead,alu_mem_read,id_function);
input[5:0] op_code;
output reg RegDst, ALUSrc, Branch, MemRead, MemWrite, RegWrite, MemToReg,JmpLink,Signed,MemDataSize,Jmp,BranchNotEqual;
output reg [3:0]ALUOp;

output reg floatRegWrite;
output reg flush,floatMux;
input [4:0] id_rs,id_rt,ex_rt,id_rd,ex_rd;
input [5:0] id_function;
input ex_memRead,alu_mem_read;
parameter R=6'h1, 
			addi=6'h9,
			addu=6'h8,
			andi=6'hc,
			beq=6'h5,
			bne=6'h4,
			j=6'h2,
			jal=6'h3,
			lbu=6'h22,
			lui=6'hf,
			lw=6'h12,
			ori=6'he,
			sb=6'h28,
			sw=6'h2b,
			FR=6'h11,
			lwc=6'h31;

always@(*)
begin  




  //r after load 
		                                     //for store word new after load
if(((ex_memRead && ((ex_rt == id_rs|| ex_rt == id_rt )) || (id_rd==ex_rt && id_function==6'h13 && op_code ==6'h1))//))
	|| (alu_mem_read && op_code ==6'h1 && ( (ex_rd == id_rs|| ex_rd == id_rt ) || (id_rd==ex_rd && id_function==6'h13)))))//for R after load word new

begin
//flush 

 RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
     ALUOp <=4'hf;
 floatMux<=1'b0;
    flush =1'b1;
	 BranchNotEqual=1'b0;
	 floatRegWrite <=1'b0;
	 
end


else
begin 
    
	 
	 case(op_code)

R:	
begin
	  RegDst <=1'b1;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h0;
	  flush =1'b0;
	  BranchNotEqual=1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;


	  
end
addi:
begin
     RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h1;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end
addu: 
begin
     RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h2;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
	end  
andi: 
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b1;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h3;
     flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
	end 		
beq: 
begin
  BranchNotEqual=1'b0;
	  RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b1;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h4;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	
	end 
bne:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h5;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b1;
	  
end 	  
j: 
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b1;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h6;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end 
jal:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b1;
	  JmpLink <=1'b1;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
     ALUOp <=4'h7;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end 
lbu: 
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b1;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b1;
	  ALUOp <=4'h8;
     flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end		 
lui:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'h9;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end	
lw:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b1;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
	  ALUOp <=4'hA;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
		 
end
ori:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b1;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'hB;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end		

sb:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b1;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b1;
	  ALUOp <=4'hC;
	  flush =1'b0;
	   floatMux<=1'b0;
	  floatRegWrite <=1'b0;
	  BranchNotEqual=1'b0;
end	
sw:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b1;
	  RegWrite <=1'b0;
	  floatRegWrite <=1'b0;
	    floatMux<=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
	  ALUOp <=4'hD;
	  flush =1'b0;
	  BranchNotEqual=1'b0;


end	
FR:begin
     RegDst <=1'b1;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  floatRegWrite <=1'b1;
	  floatMux<=1'b1;
	  MemToReg <=1'b1;
	  MemDataSize<=1'b0;
	  ALUOp <=4'he;
	  flush =1'b0;
	  BranchNotEqual=1'b0;


end
lwc:
begin
	  RegDst <=1'b0;
	  ALUSrc <=1'b1;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b1;
	  MemWrite <=1'b0;
	  RegWrite <=1'b1;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
	  ALUOp <=4'hf;
	  flush<=1'b0;
	  floatRegWrite <=1'b1;
	  floatMux<=1'b0;
	  BranchNotEqual=1'b0;
		 
end
default: 
begin 

     RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
     ALUOp <=4'hf;
 floatMux<=1'b0;
   floatRegWrite <=1'b0;
    flush =1'b0;
	 BranchNotEqual=1'b0;




end		
	  



  			

endcase
end







end

initial begin 

     RegDst <=1'b0;
	  ALUSrc <=1'b0;
	  Branch <=1'b0;
	  Jmp<=1'b0;
	  JmpLink <=1'b0;
	  Signed <=1'b0;
	  MemRead <=1'b0;
	  MemWrite <=1'b0;
	  RegWrite <=1'b0;
	  MemToReg <=1'b0;
	  MemDataSize<=1'b0;
     flush <=1'b0;
	   floatMux<=1'b0;
		
     floatRegWrite<=1'b0; 
	  BranchNotEqual=1'b0;

end















endmodule 