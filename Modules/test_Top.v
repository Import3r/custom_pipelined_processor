module test_Top();
reg [31:0] PC;
wire [31:0] result;

initial begin
PC<=32'd108;
#100 PC<=32'd112;
#100 $finish;
end

Top t1(PC, result);
endmodule
