module lwcTestBench();

reg [31:0] pc ;
Top top(pc);
reg [3:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n f0 = %h, v0 = %h \n",count,top.r2.f0,top.r1.v0);
 $display("Memory locations : \n dataMemory[0] = %h \n dataMemory[1] = %h \n dataMemory[2] = %h \n dataMemory[3] = %h \n dataMemory[4] = %h \n dataMemory[5] = %h \n dataMemory[6] = %h  \n",
      top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3],top.mem1.dataMem[4],top.mem1.dataMem[5],top.mem1.dataMem[6]);

 count=count+1;
 if(count==4'h6)
	$stop;


end
end


initial 
begin 
pc=32'h004C;
count=3'h1;

 $display("Instruction is : lwc1 f0,0(v0)  \n f0 = %h, v0 = %h ,0 \n",top.r2.f0,top.r1.v0);

 $display("Memory locations : \n dataMemory[0] = %h \n dataMemory[1] = %h \n dataMemory[2] = %h \n dataMemory[3] = %h \n dataMemory[4] = %h \n dataMemory[5] = %h \n dataMemory[6] = %h  \n",
      top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3],top.mem1.dataMem[4],top.mem1.dataMem[5],top.mem1.dataMem[6]);
 
end








endmodule 