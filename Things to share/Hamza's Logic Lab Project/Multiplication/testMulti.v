module testMulti();
reg [7:0] x,y;
wire [3:0] st;
wire [7:0] res;
initial begin
x<=8'b00000001; y<=8'b00000001; 
#25 x<=8'b00000000; y<=8'b00000000;//Zero
#25 x<=8'b00000011; y<=8'b01010101;
#25 x<=8'b00000011; y<=8'b01010110;//Carry
#25 $finish;
end
multi m1(x,y,res,st);
endmodule