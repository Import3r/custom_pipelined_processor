module testBAdder();
reg [7:0] x,y;
reg c0;
wire [3:0] st;
wire [7:0] res;
initial begin
x<=8'b00000001; y<=8'b00000001; c0<=0;
#25 x<=8'b00000000; y<=8'b00000000; c0<=0;
#25 x<=8'b11111010; y<=8'b00000110; c0<=0;
#25 $finish;
end
BAdder b1(x,y,c0,res,st);
endmodule