module testShiftRight();
reg [7:0] x;
wire [7:0] res;
initial begin
x<=8'b00000001;
#25 x<=8'b00000100;
#25 x<=8'b10000000; 
#25 x<=8'b10110010;
#25 x<=8'b00000011;
#25 $finish;
end
shiftRight s1(x,res);
endmodule