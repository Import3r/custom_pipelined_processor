module ALU_control(ex_alu_signal, alu_memread, alu_memwrite , alu_source0,shift ,alu_PCsource,alu_regDST,ex_function ,ex_aluOP,ex_alu_float,aluRegWrite );
output reg [3:0] ex_alu_signal;
output reg alu_memread;
output reg alu_regDST;
output reg alu_memwrite;
output reg alu_PCsource;
output reg alu_source0;
output reg shift;
output reg aluRegWrite;
output reg [1:0]ex_alu_float;
input [5:0] ex_function;
input [3:0] ex_aluOP;

always @(ex_function,ex_aluOP)
begin


case(ex_aluOP)

4'h00://R op 
begin



case (ex_function)
6'h20://add
begin 
alu_memread =0;alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h14://and
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0010;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h08://jr
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=1;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h21://lwn
begin 
alu_memread =1; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=1;shift=0;alu_PCsource=0;alu_regDST=1;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h27://nor
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0100;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h25://or
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b011;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h2a://slt
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h2b://sltu
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1001;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h00://sll
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b101;alu_source0=0;shift=1;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h02: //srl
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0110;alu_source0=0;shift=1;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h13://swn
begin 
alu_memread =0; alu_memwrite=1;ex_alu_signal= 4'b0000;alu_source0=1;shift=0;alu_PCsource=0;alu_regDST=1;ex_alu_float=2'b00;aluRegWrite=1'b1;
end
6'h24://sub
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b001;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h22://subu
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0001;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
6'h1a:// Div-floating
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1010;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b11;aluRegWrite=1'b0;
end
6'h10:// Move from high
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1011;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b01;aluRegWrite=1'b0;
end
6'h12:// Move from low
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1100;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b10;aluRegWrite=1'b0;
end

6'h18:// Multiply
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1101;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b11;aluRegWrite=1'b0;
end
 
 
endcase 
 end
////////////////////////////////////////////////////////////////////////////////////////////////////




4'h01://addi
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h02://addiu
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h03://andi
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0010;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h04://beq
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0001;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h05://bne
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b001;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h06://j
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h07://jal
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h08://lbu
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h09://lui
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0111;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h0A://lw
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 3'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h0B://ori
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0011;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h0C://sb
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'h0D://sw
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end




4'he: // add floating CHECK 
begin
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b1110;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end
4'hf:// load floating point  CHECK
begin 
alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;
end


default:

begin 

alu_memread =0; alu_memwrite=0;ex_alu_signal= 4'b0000;alu_source0=0;shift=0;alu_PCsource=0;alu_regDST=0;ex_alu_float=2'b00;aluRegWrite=1'b0;


end



endcase 

end

initial 
begin 
alu_PCsource=0;
ex_alu_float=2'b00;

end

endmodule 