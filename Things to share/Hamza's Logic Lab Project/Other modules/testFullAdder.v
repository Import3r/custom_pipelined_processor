module testFullAdder();
reg x,y,z;
wire s,c;
initial begin
x<=0; y<=1; z<=0;
#25 x<=0; y<=1; z<=1;
#25 x<=1; y<=1; z<=1;
#25 $finish;
end
fullAdder f1(x,y,z,s,c);
endmodule