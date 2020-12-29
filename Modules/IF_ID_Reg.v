module IF_ID_Reg(clk, PC_4_in, instruction_in,PC_4_out, instruction_out);
input clk;
input [31:0] PC_4_in, instruction_in;
output reg[31:0] PC_4_out, instruction_out;
reg [31:0] PC_4_temp, instruction_temp;

always @(posedge clk) begin
PC_4_out <= PC_4_temp;
instruction_out <= instruction_temp;
end

always @(negedge clk) begin
PC_4_temp <= PC_4_in;
instruction_temp <= instruction_in;
end
endmodule