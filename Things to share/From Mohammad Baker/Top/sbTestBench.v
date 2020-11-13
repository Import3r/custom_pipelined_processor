module sbTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n  v0 = %h ,dataMemory[7] = %h  ,dataMemory[8] = %h , dataMemory[9] = %h \n",count,top.r1.v0,
 top.mem1.dataMem[7],top.mem1.dataMem[8],top.mem1.dataMem[9]);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h002c;
count=3'h1;

 $display("Instruction is : sb v0,8($zero) \n v0 = %h ,dataMemory[7] = %h  ,dataMemory[8] = %h , dataMemory[9] = %h  \n",top.r1.v0,
 top.mem1.dataMem[7],top.mem1.dataMem[8],top.mem1.dataMem[9]);
 
end








endmodule 