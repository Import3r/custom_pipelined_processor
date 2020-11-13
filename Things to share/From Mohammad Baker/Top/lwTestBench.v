module lwTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n t3 = %h, t4 = %h ,dataMemory[0] = %h  ,dataMemory[1] = %h , dataMemory[2] = %h , dataMemory[3] = %h \n",count,top.r1.t3,top.r1.t4,
 top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3]);
 

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0030;
count=3'h1;

 $display("Instruction is : lw t3 0(t4) \n t3 = %h, t4 = %h, dataMemory[0] = %h  ,dataMemory[1] = %h , dataMemory[2] = %h , dataMemory[3] = %h  \n",top.r1.t3,top.r1.t4,
 top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3]);
 
end








endmodule 