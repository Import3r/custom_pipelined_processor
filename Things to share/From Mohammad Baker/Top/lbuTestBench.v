module lbuTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n v1= %h, zero = %h , dataMemory[0] = %h  ,dataMemory[1] = %h , dataMemory[2] = %h \n",count,top.r1.v1,top.r1.zero,
 top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2]);
 

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0034;
count=3'h1;

 $display("Instruction is : lbu v1, 0(0) \n v1= %h, zero = %h ,dataMemory[0] = %h  ,dataMemory[1] = %h , dataMemory[2] = %h  \n",top.r1.v1,top.r1.zero,
 top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2]);
 
end








endmodule 