module sltu(rs,rt,rd);
input [31:0] rs,rt;
output reg [31:0] rd;

always @* begin
if(rs<rt) rd = 32'd1;
else rd = 32'd0;
end
endmodule