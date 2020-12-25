module sign_extend(imm, sign_extended_imm,zero);
input [15:0] imm;
input zero;
output reg [31:0] sign_extended_imm;
reg [15:0] temp_imm;
reg sign;
integer i;

always @* begin
temp_imm = imm;
case(zero)
1'b0: sign = imm[15];
1'b1: sign = 1'b0;
endcase
case(sign)
1'b0: sign_extended_imm = {16'd0,temp_imm};
1'b1: sign_extended_imm = {16'd65535,temp_imm};
endcase
end
endmodule