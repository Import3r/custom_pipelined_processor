module testPG();
reg [7:0] x;
wire [3:0] stat;
initial begin
x<=8'b00000001;
#25 x<=8'b00000100;
#25 x<=8'b10000000; 
#25 x<=8'b10110010;
#25 x<=8'b00000011;
#25 x<=8'b00000000;
#25 $finish;
end
PG p1(x,stat);
endmodule