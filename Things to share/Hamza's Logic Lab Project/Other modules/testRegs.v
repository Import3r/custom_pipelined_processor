module testRegs();
reg [3:0] x,y,z;
wire [7:0] o1,o2,o3;
initial begin
x<=4'b0000; y<=4'b1000; z<=4'b1111;
#25 $finish;
end
registers r1(x,y,z,o1,o2,o3);
endmodule