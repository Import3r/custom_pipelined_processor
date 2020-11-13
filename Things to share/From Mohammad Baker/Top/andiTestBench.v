module andiTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s5 = %h ,s4= %h  \n",count,top.r1.s5,top.r1.s4);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h000c;
count=3'h1;

 $display("Instruction is : andi s5,s4,ff \n s5 = %h ,s4= %h \n",top.r1.s5,top.r1.s4);
end








endmodule 