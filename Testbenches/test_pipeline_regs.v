module test_pipeline_regs();
wire clk;
reg [31:0] PC_4_in, instruction_in;
wire[31:0] PC_4_out, instruction_out;
reg [31:0] cycle;
initial begin
cycle <= 1;
end

always @(posedge clk) begin
if (cycle == 1)
begin
PC_4_in <= 32'd200; instruction_in <= 32'hA12F0002;
$display("PC_out %d" , PC_4_out, " The correct value is XXXX");
$display("instruction_out %h" , instruction_out, " The correct value is XXXX");
end
if (cycle == 2)
begin
PC_4_in <= 32'd300; instruction_in <= 32'hF128FA02;
#1 $display("PC_out %d" , PC_4_out, " The correct value is 200");
$display("instruction_out %h" , instruction_out, " The correct value is A12F0002");
end
if (cycle == 3)
begin
PC_4_in <= 32'd300; instruction_in <= 32'hA1280002;
#1 $display("PC_out %d" , PC_4_out, " The correct value is 300");
$display("instruction_out %h" , instruction_out, " The correct value is F128FA02");
$finish;
end
cycle = cycle + 1;
end
clock c1(clk);
IF_ID_Reg i1(clk, PC_4_in, instruction_in,PC_4_out, instruction_out);
endmodule