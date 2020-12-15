module test_Top();
reg [31:0] PC;
wire [31:0] result;

initial begin
#50 PC<=32'd108;
#200 PC<=32'd112;
#1000 $finish;
end

Top t1(PC, result);
endmodule
