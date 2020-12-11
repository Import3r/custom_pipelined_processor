module add(rs,rt,rd);
input [31:0] rs,rt;
output reg [31:0] rd;

always @* begin
rd = rs+rt;
end
endmodule