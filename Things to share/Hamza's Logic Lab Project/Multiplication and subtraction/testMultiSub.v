module testMultiSub();
reg [7:0] x,y,z;
wire [3:0] st;
wire [7:0] res;
initial begin
x<=8'b00000001; y<=8'b00000001; z<=8'b00000010;
#25 x<=8'b00000000; y<=8'b00000000; z<=8'b00000001;
#25 x<=8'b00000000; y<=8'b00000000; z<=8'b00000000;//Zero
#25 x<=8'b00000011; y<=8'b01010101; z<=8'b00001100;
#25 x<=8'b00000011; y<=8'b01010110; z<=8'b00000001;//Carry
#25 $finish;
end
MS m1(x,y,z,res,st);
endmodule