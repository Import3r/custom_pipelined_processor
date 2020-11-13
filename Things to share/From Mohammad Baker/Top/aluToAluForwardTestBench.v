module aluToAluForwardTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n s5 = %h ,s4= %h  \n",count,top.r1.s5,top.r1.s4);
$display(" s7 = %h ,s5= %h , s6 = %h \n",top.r1.s7,top.r1.s5,top.r1.s6);

 count=count+1;
 if(count==3'h7)
	$stop;


end
end


initial 
begin 
pc=32'h000c;
count=3'h1;
top.r1.s5=0;
 $display("First  instruction is : andi s5,s4,ff \n s5 = %h ,s4= %h \n",top.r1.s5,top.r1.s4);
 $display("Second instruction is : stl s7,s5,s6 \n s7 = %h ,s6= %h , s5 = %h \n",top.r1.s7,top.r1.s5,top.r1.s6);
end








endmodule 