module luiTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s0= %h , zero = %h  \n",count,top.r1.s0,top.r1.zero);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0028;
count=3'h1;

 $display("Instruction is : lui s0,zero,1 \n  s0= %h , zero = %h , 1\n",top.r1.s0,top.r1.zero);
end








endmodule 