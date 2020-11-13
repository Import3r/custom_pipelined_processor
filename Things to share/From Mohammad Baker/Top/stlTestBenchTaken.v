module stlTestBenchTaken();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s7 = %h ,s5= %h , s6 = %h \n",count,top.r1.s7,top.r1.s5,top.r1.s6);

 count=count+1;
 if(count==3'h6)
	$stop;


end
end


initial 
begin 
pc=32'h0054;
count=3'h1;
top.r1.s5=0;
 $display("Instruction is : stl s7,s5,s6 \n s7 = %h ,s6= %h , s5 = %h \n",top.r1.s7,top.r1.s5,top.r1.s6);
end








endmodule 