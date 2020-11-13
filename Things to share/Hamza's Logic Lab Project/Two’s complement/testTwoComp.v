module testTwoComp();
reg [7:0] in;
wire [7:0] out;
initial begin
in<=8'b00001000;
#25 in<=8'b10011100;
#25 $finish;
end
twoComp o1(in,out);
endmodule