module mfhiAfterDivTestBench();

reg [31:0] pc ;
Top top(pc);
reg [2:0] count;

always @(posedge top.c1.clk)
begin 
begin :loop
$display("cycle #%d \n zero = %h ,a1= %h, a0= %h , hi= %h , lo =%h , t9 = %h \n",count,top.r1.zero,top.r1.a1,top.r1.a0,top.r1.hi,top.r1.lo,top.r1.t9);

 count=count+1;
 if(count==3'h7)
	$stop;


end
end


initial 
begin 
pc=32'h001c;
count=3'h1;

 $display("First  Instruction is : div zero,a1,a0 \n zero = %h ,a1= %h, a0= %h , hi= %h , lo =%h \n",top.r1.zero,top.r1.a1,top.r1.a0,top.r1.hi,top.r1.lo);
 $display("second Instruction is : mfhi t9,zero,zero \n zero = %h , t9= %h , hi= %h , lo =%h \n",top.r1.zero,top.r1.t9,top.r1.hi,top.r1.lo);
end








endmodule 