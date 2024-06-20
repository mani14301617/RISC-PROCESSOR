`timescale 1ns / 1ps
module info_decode(
input [63:0]if_id,
input id_ex_Mem_read,
input [4:0]id_ex_reg_rt,
input [4:0]id_ex_reg_rd,
input mem_wb_reg_write,
input [4:0]w_reg,
input [31:0]w_data,
output stall,
output flush,
output PCsrc,
output reg [129:0]id_ex,
input clk,
input rst,
output [31:0]pc_b
);

wire ALU_src;
wire Reg_Write;
wire branch;
wire reg_dst;
wire jump;
wire Mem_read;
wire Mem_write;
wire MemtoReg;
wire [1:0]ALU_op;
wire [5:0]c_input;
assign c_input=if_id[31:26];
control_id ci(.c_input(c_input),.ALU_op(ALU_op),.ALU_src(ALU_src),.Reg_Write(Reg_Write),
.jump(jump),.branch(branch),.reg_dst(reg_dst),.Mem_read(Mem_read),.Mem_write(Mem_write),.MemtoReg(MemtoReg));

wire [4:0]if_id_reg_rt,if_id_reg_rs;
assign if_id_reg_rt=if_id[20:16];
assign if_id_reg_rs=if_id[25:21];
hazard_detection_unit_id hdu(.id_ex_Mem_read(id_ex_Mem_read),.Mem_write(Mem_write),.id_ex_reg_rd(id_ex_reg_rd),.id_ex_reg_rt(id_ex_reg_rt),
.if_id_reg_rt(if_id_reg_rt),.if_id_reg_rs(if_id_reg_rs),
.stall(stall));

//reg [31:0]b_add;
wire  [31:0]r_data1;
wire  [31:0]r_data2;
wire [31:0]sign_extend_offset;

register_file rf(.r_reg1(if_id_reg_rs),.r_reg2(if_id_reg_rt),.w_reg(w_reg),.w_data(w_data),.Reg_Write(mem_wb_reg_write),
.r_data1(r_data1),.r_data2(r_data2));

assign sign_extend_offset={{16{if_id[15]}},if_id[15:0]};
always@(posedge clk or posedge rst)
begin
if(rst) begin id_ex<=0;  end 
else if(stall) begin id_ex<={{8{1'b0}},r_data1,r_data2,if_id[5:0],sign_extend_offset,if_id[25:21],if_id[20:16],if_id[20:16],if_id[15:11]}; end 

else  begin id_ex<={MemtoReg,Reg_Write,Mem_write,Mem_read,reg_dst,ALU_op,ALU_src,r_data1,r_data2,if_id[5:0],sign_extend_offset,if_id[25:21],if_id[20:16],if_id[20:16],if_id[15:11]}; end 

end 

assign pc_b=(branch)?(if_id[63:32]+(sign_extend_offset<<2)):((jump)?{if_id[63:60],(if_id[25:0]<<2)}:0);
assign flush=((r_data1==r_data2)&branch)?1:0;
assign PCsrc=(((r_data1==r_data2)&branch)|jump)?1:0;

endmodule
