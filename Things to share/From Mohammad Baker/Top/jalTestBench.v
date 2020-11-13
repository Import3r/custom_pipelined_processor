module jalTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n pc = %h , ra=%h \n",count,top.p1.out,top.r1.ra);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0060;
count=3'h1;

 $display("Instruction is :jal 0  \n pc = %h ,ra=%h \n",pc,top.r1.ra);
end








endmodule 