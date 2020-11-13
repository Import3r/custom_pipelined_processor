module If_Id_reg(flush,pc_in,inst_in,pc_out,inst_out,clk);
input [31:0] pc_in ,inst_in;
output reg [31:0] pc_out,inst_out;
input clk;
input flush;
always @(posedge clk)
begin 
if(~flush)begin
pc_out <= pc_in;
inst_out <= inst_in;
end
end


initial 
begin 
#1 pc_out <= pc_in;
#1 inst_out <= inst_in;

end





endmodule 