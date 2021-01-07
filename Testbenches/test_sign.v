module test_sign();
reg [15:0] immm;
wire [31:0] sign_imm;
reg zero;
initial begin
immm <= 16'b0000000000001101; zero<=1'b0;
#25 immm <= 16'b1000101101100001; zero<=1'b0;
#25 immm <= 16'b1000101101100001; zero<=1'b1;
#25 $finish;
end
sign_extend s1(immm, sign_imm,zero);
endmodule