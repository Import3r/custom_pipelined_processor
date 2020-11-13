module ALUmod(op_1, op_2, ALU_cont,  zeroF, Result,overflow );

output reg [63:0] Result;
output reg zeroF,overflow;
input  [31:0] op_1, op_2;
input [3:0] ALU_cont;

reg[24:0] op_1_fraction,op_2_fraction,result_fraction;
reg [7:0] op_1_exponent,op_2_exponent,result_exponent;
reg op_1_sign,op_2_sign,result_sign;
reg [31:0] temp1,temp2;
always @(*)
begin 
overflow=0;
case(ALU_cont)
4'b0000: begin  
					Result= {32'h0,op_1 + op_2};
					overflow=Result[32];
					
			end
4'b0001:  begin  
					Result= {32'h0,op_1 - op_2};
					overflow=Result[32];
					
			end
4'b0010:  Result= {32'h0,op_1 & op_2};
4'b0011:  Result= {32'h0,op_1 || op_2};
4'b0100:  Result= {32'h0,~(op_1 || op_2)};
4'b0101:  Result= {32'h0,op_1 << op_2[10:6]}; //shift left (op_1) by shift amount
4'b0110:  Result= {32'h0,op_1 >> op_2[10:6]}; //shift right (op_1) by shift amount
4'b0111:  Result= {32'h0,{op_2[15:0],16'h0000}}; //load upper immediate
4'b1000:  //set less than
begin
if (op_2> op_1 )
	 Result = 64'h01;
	 else 
	 Result = 64'h00;
end
4'b1001:  //set less than immediate
begin
if (op_2> op_1 )
	 Result = 64'h01;
	 else 
	 Result = 63'h00;
	 
end	 
	 
4'b1010: // divide for floating
begin
Result[31:0]=op_1/op_2;
Result[63:32]=op_1%op_2;
end
4'b1011: // move from high
begin
end
4'b1100: // move from low
begin 
end
4'b1101:// mult for floating
begin
Result[63:0]=op_1 * op_2;
end	 

4'b1110://add floating
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
Result={32'h0,result_sign,(result_exponent[7:0]),result_fraction[22:0]};


end





	
endcase




if (Result ==0)
	zeroF=1;
	
	else zeroF=0;
end




endmodule 


