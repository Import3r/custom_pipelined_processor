module PC_module(clk,PC_in,PC_initial, PC_out);
input clk;
input [31:0] PC_in,PC_initial;
output reg [31:0] PC_out;
reg [31:0] PC_temp,cycle;

initial begin
#1 PC_temp = PC_initial;
cycle <= 1;
end

always @(posedge clk) begin
PC_out = PC_temp;
end
always @(negedge clk) begin
//if (cycle % 8 == 0) begin
PC_temp = PC_in;
//end
cycle = cycle + 1;
end
endmodule