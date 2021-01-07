module test_ALUcontrol();
wire clk;
reg [2:0] ALUop;
reg [5:0] func;
wire [3:0] ALUcontrol_signal;

initial begin
#50 ALUop <= 3'd2; func <= 6'h21; //beq
#100 ALUop <= 3'd4; func <= 6'd65; //ori
#100 ALUop <= 3'd0; func <= 6'h2a; //R
#100 $finish;
end
clock c1(clk);
ALUcontrol a1(clk, ALUop, func,ALUcontrol_signal);
endmodule