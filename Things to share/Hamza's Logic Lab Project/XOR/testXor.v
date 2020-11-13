module testXor();
reg [7:0] x,y;
wire [3:0] st;
wire [7:0] res;
initial begin
x<=8'b00000001; y<=8'b00000001;
#25 x<=8'b00000000; y<=8'b00000000; 
#25 x<=8'b11111010; y<=8'b00000110;
#25 $finish;
end
x_or x1(x,y,res,st);
endmodule