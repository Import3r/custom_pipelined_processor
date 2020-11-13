module lw_add_sw_TestBench();

reg [31:0] pc ;
Top top(pc);
reg [3:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s0 = %h, s1 = %h \n",count,top.r1.s0,top.r1.s1);
 $display("Memory locations : \n dataMemory[0] = %h \n dataMemory[1] = %h \n dataMemory[2] = %h \n dataMemory[3] = %h  \n dataMemory[12] = %h \n dataMemory[13] = %h \n dataMemory[14] = %h \n dataMemory[15] = %h  \n",
      top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3],top.mem1.dataMem[12],top.mem1.dataMem[13],top.mem1.dataMem[14],top.mem1.dataMem[15]);

 count=count+1;
 if(count==4'h9)
	$stop;


end
end


initial 
begin 
pc=32'h0040;
count=3'h1;

 $display("First  Instruction is : lw s1,0(0)  \n s1 = %h, zero = %h ,0 \n",top.r1.s1,top.r1.zero);
 $display("Second Instruction is : add s0,s1,s1  \n s0 = %h, s1 = %h  \n",top.r1.s0,top.r1.s1);
 $display("Third  Instruction is : sw s0,12(zero)  \n s0 = %h, zero= %h ,12 \n",top.r1.s0,top.r1.zero);
 $display("Memory locations : \n dataMemory[0] = %h \n dataMemory[1] = %h \n dataMemory[2] = %h \n dataMemory[3] = %h \n dataMemory[12] = %h \n dataMemory[13] = %h \n dataMemory[14] = %h \n dataMemory[15] = %h  \n",
      top.mem1.dataMem[0],top.mem1.dataMem[1],top.mem1.dataMem[2],top.mem1.dataMem[3],top.mem1.dataMem[12],top.mem1.dataMem[13],top.mem1.dataMem[14],top.mem1.dataMem[15]);
 
end








endmodule 