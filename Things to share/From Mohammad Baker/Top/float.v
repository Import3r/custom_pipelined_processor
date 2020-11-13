module float(op_1,op_2,Result);
input [31:0] op_1 ,op_2;
output  reg [31:0] Result;


reg[24:0] op_1_fraction,op_2_fraction,result_fraction;
reg [7:0] op_1_exponent,op_2_exponent,result_exponent;
reg op_1_sign,op_2_sign,result_sign;
reg [31:0] temp1,temp2;
always @(*)
begin 
op_1_fraction={2'b01,op_1[22:0]};
op_2_fraction={2'b01,op_2[22:0]};

op_1_exponent=op_1[30:23]-127;
op_2_exponent=op_2[30:23]-127;

op_1_sign=op_1[31];
op_2_sign=op_2[31];

if(op_1_exponent>=op_2_exponent)
begin 
op_2_fraction=op_2_fraction>>(op_1_exponent-op_2_exponent);

result_exponent=op_1_exponent;


end

else 
begin 
op_1_fraction=op_1_fraction>>(op_2_exponent-op_1_exponent);

result_exponent=op_2_exponent;
end


if((op_1[31] ^op_2[31])==0)
begin 

result_sign=op_1_sign;
result_fraction=op_1_fraction+op_2_fraction;

end

else 
begin 
temp1= op_1_fraction * (2**op_1_exponent);
temp2= op_2_fraction * (2**op_2_exponent);
if(temp1 > temp2)
begin 

result_fraction=op_1_fraction-op_2_fraction;

result_sign=op_1[31];

end
else 
begin

result_fraction=op_2_fraction-op_1_fraction;

result_sign=op_2[31];
end
end 









if(result_fraction[24])
begin
result_fraction=result_fraction>>1;
result_exponent=result_exponent+1;

end








/*
if(result_fraction==0)
begin 
result_exponent=0;
result_sign=0;
end
*/





while(result_fraction[23]==0 && result_fraction!=0)
begin 
result_fraction=result_fraction<<1;
result_exponent=result_exponent-1;
end















result_exponent=result_exponent+127;
Result={result_sign,(result_exponent[7:0]),result_fraction[22:0]};
end




  endmodule 