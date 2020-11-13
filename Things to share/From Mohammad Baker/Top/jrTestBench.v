module jrTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n pc = %h , k0=%h \n",count,top.p1.out,top.r1.k0);

 count=count+1;
 if(count==3'h4)
	$stop;


end
end


initial 
begin 
pc=32'h005c;
count=3'h1;

 $display("Instruction is :jr k0 \n pc = %h , k0=%h \n",pc,top.r1.k0);
end








endmodule 