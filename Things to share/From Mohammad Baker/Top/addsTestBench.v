module addsTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n f4 = %h ,f3= %h , f2= %h \n",count,top.r2.f4,top.r2.f3,top.r2.f2);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0050;
count=3'h1;

 $display("Instruction is : add.s f4,f3,f2 \n f4 = %h,f3= %h , f2= %h \n",top.r2.f4,top.r2.f3,top.r2.f2);
end








endmodule 