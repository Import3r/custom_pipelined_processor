module sllTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n sll t4,t3,zero \n t4 = %h ,t3= %h , zero = %h  \n",count,top.r1.t4,top.r1.t3,top.r1.zero);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0014;
count=3'h1;

 $display("Instruction is : sll t4,t3,zero \n t4 = %h ,t3= %h , zero = %h \n",top.r1.t4,top.r1.t3,top.r1.zero);
end








endmodule 