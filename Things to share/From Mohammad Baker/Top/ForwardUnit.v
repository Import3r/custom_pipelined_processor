module ForwardUnit(ex_rd,aluMemWrite,mem_write,ex_rs,ex_rt,mem_register_destination,wb_register_destination,mem_RegWrite,wb_RegWrite,alu_op,forwardA,forwardB,forwardC);
input [4:0] ex_rd,ex_rs,ex_rt,mem_register_destination,wb_register_destination;
input mem_RegWrite,wb_RegWrite,aluMemWrite,mem_write;
output reg [1:0]  forwardA,forwardB,forwardC;
input[3:0] alu_op;
always @(*)begin 

forwardA=2'b00;
forwardB=2'b00;
forwardC=2'b00;


//EX hazard 

if((mem_RegWrite && mem_register_destination != 5'h00)
	&& (mem_register_destination== ex_rs))
			forwardA =2'b10;
			                                                  //not store or store word new 
 if ( (mem_RegWrite && mem_register_destination != 5'h00 && ! aluMemWrite && !mem_write)
	&& (mem_register_destination== ex_rt))		 
						forwardB =2'b10;
						// if store insturction
if ( (mem_RegWrite && mem_register_destination != 5'h00 ) && (aluMemWrite|| mem_write)
	&& (mem_register_destination== ex_rt))						
						forwardC =2'b10;
						

 if (( alu_op == 4'h0 &&mem_RegWrite && mem_register_destination != 5'h00 && aluMemWrite) ///swn ,lwn
	&& (mem_register_destination== ex_rd))		
						forwardB =2'b10;
						
						
//MEM hazard 
						
 if((wb_RegWrite && wb_register_destination != 5'h00) && !((mem_RegWrite && mem_register_destination != 5'h00)
	&& (mem_register_destination== ex_rs))
	&& (wb_register_destination== ex_rs) )
			forwardA =2'b01;
			
 if (( wb_RegWrite && wb_register_destination != 5'h00 && ! aluMemWrite && !mem_write) && !( (mem_RegWrite && mem_register_destination != 5'h00)
	&& (mem_register_destination== ex_rt))		
	&& (wb_register_destination== ex_rt))
			forwardB =2'b01;
			// if store insturction
 if 	((  wb_RegWrite && wb_register_destination != 5'h00 && (aluMemWrite|| mem_write)) && !( (mem_RegWrite && mem_register_destination != 5'h00)
	&& (mem_register_destination== ex_rt))		
	&& (wb_register_destination== ex_rt))
			forwardC=2'b01;
			
 if ((alu_op == 4'h0 &&wb_RegWrite && wb_register_destination != 5'h00 &&aluMemWrite) && !(( alu_op == 4'h0 &&mem_RegWrite && mem_register_destination != 5'h00 && aluMemWrite)
	&& (mem_register_destination== ex_rd))	
	&& (wb_register_destination== ex_rd))
			forwardB =2'b01;




end


endmodule 