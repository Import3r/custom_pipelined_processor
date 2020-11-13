module addiTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n a0= %h ,a1= %h  \n",count,top.r1.a0,top.r1.a1);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0070;
count=3'h1;

 $display("Instruction is : addi a0,a1,5 \n a0 = %h ,a1= %h \n",top.r1.a0,top.r1.a1);
end








endmodule 