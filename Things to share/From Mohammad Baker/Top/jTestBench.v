module jTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n pc = %h \n",count,top.p1.out);

 count=count+1;
 if(count==3'h3)
	$stop;


end
end


initial 
begin 
pc=32'h0058;
count=3'h1;

 $display("Instruction is :j 2\n pc = %h  \n",pc);
end








endmodule 