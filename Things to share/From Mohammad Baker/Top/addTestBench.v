module addTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s2 = %h ,s1= %h , s0= %h \n",count,top.r1.s2,top.r1.s1,top.r1.s0);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0004;
count=3'h1;

 $display("Instruction is : add s2,s1,s0 \n s2 = %h ,s1= %h , s0= %h \n",top.r1.s2,top.r1.s1,top.r1.s0);
end








endmodule 