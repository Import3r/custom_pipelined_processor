module testOneComp();
reg [7:0] in;
wire [7:0] out;
initial begin
in<=8'b00000000;
#25 in<=8'b10011100;
#25 $finish;
end
oneComp o1(in,out);
endmodule