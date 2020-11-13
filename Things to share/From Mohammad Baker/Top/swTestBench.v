module swTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s0 = %h, zero = %h, dataMemory[12] = %h  ,dataMemory[13] = %h , dataMemory[14] = %h , dataMemory[15] = %h \n",count,top.r1.s0,top.r1.zero,
 top.mem1.dataMem[12],top.mem1.dataMem[13],top.mem1.dataMem[14],top.mem1.dataMem[15]);
 

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0048;
count=3'h1;
top.r1.s0=32'hf1f4f5f6;
 $display("Instruction is : sw s0,12(zero) \n s0 = %h, zero = %h ,12, dataMemory[12] = %h  ,dataMemory[13] = %h , dataMemory[14] = %h , dataMemory[15] = %h  \n",top.r1.s0,top.r1.zero,
 top.mem1.dataMem[12],top.mem1.dataMem[13],top.mem1.dataMem[14],top.mem1.dataMem[15]);
 
end








endmodule 