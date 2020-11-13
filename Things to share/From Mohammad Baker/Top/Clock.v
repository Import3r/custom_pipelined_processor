module Clock(clk);

output reg clk ;


always @(clk)
begin 
#500 clk<=~clk;

end


initial 
begin
#1 clk <=1;

end

endmodule 