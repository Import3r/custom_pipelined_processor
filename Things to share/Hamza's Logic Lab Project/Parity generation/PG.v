module PG(result,status);
input [7:0] result;
output reg [3:0] status;
integer c,i;
always @* begin
c=0;
	for (i=0;i<8;i=i+1) begin
		if(result[i] == 1) begin
			c=c+1;
		end
	end
	if(c%2 == 0) begin
		status[1] = 1'b1;
	end
	else begin
		status[1] = 1'b0;
	end
end
endmodule