module PC_module(clk,PC_in,PC_initial, PC_out,PC_write);
input clk, PC_write;
input [31:0] PC_in,PC_initial;
output reg [31:0] PC_out;
reg [31:0] PC_temp,cycle;

initial begin
#1 PC_temp = PC_initial;
end

always @(posedge clk) begin
if (PC_write) PC_out = PC_temp;
end

always @(negedge clk) begin
PC_temp = PC_in;
end
endmodule