module slt(rs,rt,rd);
input [31:0] rs,rt;
output reg [31:0] rd;
reg [31:0] less;
always @* begin
if(rs[30:0]<rt[30:0]) less = 32'd1;
else less = 32'd0;

if(rs[31] == 0 && rt[31] == 0) rd = less;
else if(rs[31] == 0 && rt[31] == 1) rd = 32'd0;
else if(rs[31] == 1 && rt[31] == 0) rd = 32'd1;
else if(rs[31] == 1 && rt[31] == 1) rd = ~less;
end
endmodule