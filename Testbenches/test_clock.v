module test_clock();
wire clk;
initial begin
#1000 $finish;
end
clock c1(clk);
endmodule