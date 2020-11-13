module Top(pc1);
///////////////////////////////////////////////////////fetch///////////////////////////////////
reg [31:0] pc ;
input [31:0] pc1;
wire clk ;
Clock c1(clk);
wire [31:0]if_pcSrc,if_pc,if_pc_4;
//wire write;

Pc p1(if_pcSrc,clk,if_pc,pc1,flush);

Adder a1(if_pc,32'h4,if_pc_4);

wire [31:0] if_inst;
InstructionMemory i1(if_inst,if_pc);
wire [31:0]id_pc_4;
wire [31:0] id_inst;
If_Id_reg reg1(flush,if_pc_4,if_inst,id_pc_4,id_inst,clk);
wire [3:0] wb_wb_out;
wire [1:0] wb_float;
wire wb_alu_RegWrite;
///////////////////////////////////////////////////////decode///////////////////////////////////
wire RegDst, ALUSrc, Branch,BranchNotEqual, MemRead, MemWrite, RegWrite, MemToReg,JmpLink,Signed,MemDataSize,Jmp,floatRegWrite,floatMux;
wire [3:0]ALUOp;


wire [31:0] ex_pc_4,ex_rs_data,ex_rt_data,ex_rd_data,ex_Singed_imd;
wire [4:0] ex_rt,ex_rd,ex_rs;
wire [2:0] ex_mem_out;
wire  [6:0] ex_ex_out; 
wire [3:0] ex_wb_out;
wire alu_memread;

controlUnit control1(flush,RegDst,ALUOp, ALUSrc, Branch,BranchNotEqual,Jmp,JmpLink,Signed, MemRead, MemWrite, RegWrite, MemToReg,MemDataSize,floatRegWrite,floatMux,id_inst[31:26],id_inst[25:21],id_inst[20:16],id_inst[15:11],ex_rd,ex_rt,ex_mem_out[1:1],alu_memread,id_inst[5:0]);





 wire [31:0] target_address;
wire [27:0] address_27;
wire [14:0]control_in;
assign control_in ={BranchNotEqual,floatRegWrite,RegWrite, MemToReg,JmpLink,MemDataSize,MemRead, MemWrite,RegDst,ALUOp,ALUSrc,Branch};
ShiftLeft shift1(id_inst[25:0] ,address_27);
assign target_address={id_pc_4[31:28],address_27};


wire [4:0] wb_register_destination;
wire [4:0]wb_final;
WrMux2X1 write_register_mux(wb_register_destination,5'h1f,wb_wb_out[0],wb_final);


wire [31:0] id_rs_data ,id_rt_data,id_rd_data;
wire [63:0] wb_write_data;
wire [31:0] id_fs_data ,id_ft_data;


Registers r1(id_rs_data,id_rt_data,id_rd_data,id_inst[25:21],id_inst[20:16],id_inst[15:11],wb_final,wb_write_data,wb_wb_out[2]^ wb_alu_RegWrite,clk,wb_float);

FloatRegisters r2(id_fs_data,id_ft_data,id_inst[15:11],id_inst[20:16],wb_register_destination,wb_write_data,wb_wb_out[3],clk);

wire [31:0]id_signed_imd,id_unSigned_imd;
signeExtension sign1(id_inst[15:0],id_signed_imd);
ZeroExtension sign12(id_inst[15:0] ,id_unSigned_imd);

wire [31:0] id_final_imd;
SignedMux2X1 zero_sign_extension_mux(id_signed_imd,id_unSigned_imd,Signed,id_final_imd);

wire [31:0] id_data1,id_data2;
wire [4:0] id_registerD;
wire ex_BranchNotEqual;

SignedMux2X1 rs_float1_mux(id_rs_data,id_fs_data,floatMux,id_data1);
SignedMux2X1 rt_float2_mux(id_rt_data,id_ft_data,floatMux,id_data2);
WrMux2X1     rd_float3_mux(id_inst[15:11] ,id_inst[10:6],floatRegWrite,id_registerD);



Id_Ex_reg reg2(id_pc_4,id_data1,id_data2,id_rd_data,id_final_imd,id_inst[20:16],id_registerD,id_inst[25:21],control_in,ex_pc_4,ex_rs_data,ex_rt_data,ex_rd_data,ex_Singed_imd,ex_rt,ex_rd,ex_rs,clk,
					ex_ex_out,ex_mem_out,ex_wb_out,ex_BranchNotEqual);
	

///////////////////////////////////////////////////////Ex///////////////////////////////////
wire [31:0] shifted_signed_imd;
ShiftLeft2 shift2(ex_Singed_imd,shifted_signed_imd);
wire [31:0] ex_branch_address;
wire [31:0] ex_op1F_data,ex_op2F_data;
wire [31:0] ex_op1_data,ex_op2_data;


wire mem_alu_mem_read,mem_alu_mem_write;
wire [31:0] mem_rt_data;
wire [63:0] mem_alu_res;
wire [4:0] mem_register_destination;
wire [2:0] mem_mem_out;
wire [3:0] mem_wb_out; 

wire [1:0] ex_float;
wire [1:0] mem_float;


BranchAdder a2(ex_pc_4,shifted_signed_imd,ex_branch_address);
wire[1:0] forwardA,forwardB,forwardC;
wire alu_memwrite;
wire alu_RegWrite;
ForwardUnit f1(ex_rd,alu_memwrite,ex_mem_out[0],ex_rs,ex_rt,mem_register_destination,wb_register_destination,mem_wb_out[2],wb_wb_out[2],ex_ex_out[5:2],forwardA,forwardB,forwardC);

SignedMux2X1 rs_jal1_mux( ex_rs_data ,ex_pc_4,ex_wb_out[0],ex_op1F_data);
forwardMux3X1 forwardA_mux (ex_op1F_data,wb_write_data,mem_alu_res,forwardA,ex_op1_data);

wire  alu_source0,shift ,alu_PCsource,alu_regDST;
wire [3:0] ex_alu_signal;
ALU_control alu_control(ex_alu_signal, alu_memread, alu_memwrite , alu_source0,shift ,alu_PCsource,alu_regDST,ex_Singed_imd[5:0] ,ex_ex_out[5:2],ex_float,alu_RegWrite);
wire [31:0]ex_op_mux_1;
Mux3X1 rs_extension_rd_mux(ex_rt_data,ex_Singed_imd,ex_rd_data,(shift ^ ex_ex_out[1]),alu_source0,ex_op_mux_1);
SignedMux2X1 jal2_mux( ex_op_mux_1 ,32'h4,ex_wb_out[0],ex_op2F_data);
forwardMux3X1 forwardB_mux (ex_op2F_data,wb_write_data,mem_alu_res,forwardB,ex_op2_data);

wire [4:0] ex_register_destination;
WrMux2X1 reg_destination_mux(ex_rt,ex_rd,(alu_regDST ^ ex_ex_out[6]),ex_register_destination);

wire ex_zero,ex_overflow;

wire [63:0] ex_alu_res;
ALUmod alu1(ex_op1_data,ex_op2_data, ex_alu_signal,  ex_zero, ex_alu_res,ex_overflow);

wire beq,bne,pcSrc;

assign beq=ex_ex_out[0] & ex_zero;
assign bne=ex_BranchNotEqual &(~ex_zero);
assign pcSrc = beq | bne;
wire [31:0] ex_rt_data_final;
forwardMux3X1 forwardC_mux (ex_rt_data,wb_write_data,mem_alu_res,forwardC,ex_rt_data_final);

wire mem_alu_RegWrite;

			
 Ex_Mem_reg reg3(ex_wb_out,ex_mem_out,ex_alu_res,ex_rt_data_final,ex_register_destination,alu_memread,alu_memwrite,ex_float,alu_RegWrite,clk,
					mem_wb_out,mem_mem_out,mem_alu_res,mem_rt_data,mem_register_destination,mem_alu_mem_read,mem_alu_mem_write,mem_float,mem_alu_RegWrite);

////////////////////////////////////////////////////////////////////Mem////////////////////////////////////////////////
wire [31:0] mem_read_data;

DataMemory mem1(mem_read_data,mem_alu_res[31:0],mem_rt_data,mem_mem_out[0] ^ mem_alu_mem_write,mem_mem_out[1] ^ mem_alu_mem_read,mem_mem_out[2],clk);


wire [31:0] wb_read_data;
wire [63:0]wb_alu_res;
wire wb_alu_mem_read;
Mem_Wb_reg reg4(mem_wb_out,mem_read_data,mem_alu_res,mem_register_destination,mem_float,mem_alu_mem_read,mem_alu_RegWrite,clk,wb_wb_out,wb_read_data,wb_register_destination,wb_alu_res,wb_float,wb_alu_mem_read,wb_alu_RegWrite);

writeMux2X1 write_data_mux( wb_read_data ,wb_alu_res,wb_wb_out[1]^wb_alu_mem_read,wb_write_data);



/////////////////////////////////////////////////////////////pc_class////////////////////////
wire [31:0] if_pc_address;
SignedMux2X1 pc_jump_mux( if_pc_4 ,target_address,Jmp,if_pc_address);

Mux3X1 pc_src_mux(if_pc_address,ex_branch_address,ex_op1_data,pcSrc,alu_PCsource,if_pcSrc);
 
 
 initial begin 
 
 pc=32'h0;

 

 
 end




endmodule 