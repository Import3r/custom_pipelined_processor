module beqTestBenchTaken();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n pc = %h , zero =%h \n",count,top.p1.out,top.r1.zero);

 count=count+1;
 if(count==3'h4)
	$stop;


end
end


initial 
begin 
pc=32'h0064;
count=3'h1;

 $display("Instruction is :beq z0,z0,0 \n pc = %h ,zero=%h \n",pc,top.r1.zero);
end








endmodule 