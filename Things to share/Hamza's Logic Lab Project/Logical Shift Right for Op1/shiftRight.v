module shiftRight(op1,result);
input [7:0] op1;
output reg [7:0] result;

always @* begin
result = op1 >> 1;
end
endmodule