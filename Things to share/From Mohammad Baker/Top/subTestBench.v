module subTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n t2 = %h ,t1= %h , t0= %h \n",count,top.r1.t2,top.r1.t1,top.r1.t0);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0008;
count=3'h1;

 $display("Instruction is : sub t2,t1,t0 \n t2 = %h ,t1= %h , t0= %h \n",top.r1.t2,top.r1.t1,top.r1.t0);
end








endmodule 