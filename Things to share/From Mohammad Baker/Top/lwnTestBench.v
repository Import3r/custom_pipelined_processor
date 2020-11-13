module lwnTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n gp= %h, sp= %h , fp=%h, dataMemory[0] = %h  ,dataMemory[1] = %h , dataMemory[2] = %h , dataMemory[3] = %h  \n",count,top.r1.gp,top.r1.sp,top.r1.fp,
 top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3]);
 

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h003c;
count=3'h1;

 $display("Instruction is : lwn gp,sp,fp \n gp= %h, sp= %h , fp=%h, dataMemory[0] = %h  ,dataMemory[1] = %h , dataMemory[2] = %h , dataMemory[3] = %h  \n",top.r1.gp,top.r1.sp,top.r1.fp,
 top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3]);
 
end








endmodule 