module swnTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n a0= %h, t9= %h , t5=%h, dataMemory[3] = %h  ,dataMemory[4] = %h , dataMemory[5] = %h , dataMemory[6] = %h  \n",count,top.r1.a0,top.r1.t9,top.r1.t5,
 top.mem1.dataMem[3],top.mem1.dataMem[4],top.mem1.dataMem[5],top.mem1.dataMem[6]);
 

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0038;
count=3'h1;

 $display("Instruction is : swn a0,t9,t5 \n a0= %h, t9= %h , t5=%h, dataMemory[3] = %h  ,dataMemory[4] = %h , dataMemory[5] = %h , dataMemory[6] = %h  \n",top.r1.a0,top.r1.t9,top.r1.t5,
 top.mem1.dataMem[3],top.mem1.dataMem[4],top.mem1.dataMem[5],top.mem1.dataMem[6]);
 
end








endmodule 