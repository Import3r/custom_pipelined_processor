module Id_Ex_reg(pc_in,rs_data_in,rt_data_in,rd_data_in,imd_in,rt_in,rd_in,rs_in,control_in,pc_out,rs_data_out,rt_data_out,rd_data_out,imd_out,rt_out,rd_out,rs_out,clk,
						ex_out,mem_out,wb_out,ex_branchNotEqual);
						
						
						
input [31:0] pc_in ,rs_data_in,rt_data_in,imd_in,rd_data_in;
input [4:0] rt_in,rd_in,rs_in;
input [14:0] control_in;
output reg  [2:0] mem_out;
output reg [6:0] ex_out;
output reg ex_branchNotEqual;
output reg  [3:0] wb_out;
input clk ;
output reg [31:0] pc_out ,rs_data_out,rt_data_out,imd_out,rd_data_out;

output reg  [4:0] rt_out,rd_out,rs_out;


always@(posedge clk )
begin 
pc_out <= pc_in;
rs_data_out <= rs_data_in;
rt_data_out <= rt_data_in;
imd_out <= imd_in ;

rt_out <= rt_in;
rd_out <= rd_in ;
rs_out <= rs_in ;
wb_out <= control_in[13:10];
mem_out <=control_in[9:7];
ex_out <= control_in[6:0];

rd_data_out<=rd_data_in;
ex_branchNotEqual <= control_in[14];

end

initial begin 

mem_out<=3'b000;
rt_out<=5'b00000;
rs_out<=5'b00000;

end


endmodule 