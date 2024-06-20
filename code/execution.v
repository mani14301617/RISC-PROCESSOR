`timescale 1ns / 1ps
module execution(
input [129:0]id_ex,
output reg [72:0]ex_mem,
input [4:0]ex_mem_rd,
input [4:0]mem_wb_rd,
input mem_wb_regwrite,
input ex_mem_regwrite,
output id_ex_memread,
input [31:0]ex_mem_data,
input [31:0]mem_wb_data,
output [4:0]id_ex_reg_rt,
output [4:0]id_ex_reg_rd,
input clk,
input rst
);
assign id_ex_reg_rt=id_ex[9:5];
assign id_ex_reg_rd=id_ex[4:0];
wire [2:0]op;
//wire [1:0]ALU_op;
//assign ALU_op=id_ex[124:123];

wire [4:0]t_id_ex_rs,t_id_ex_rt;
wire [31:0] result;
wire [31:0]data1,data2p,data2;
wire [1:0]fa; 
wire [1:0]fb;
wire [4:0]dest;
wire [31:0]w_data;
assign t_id_ex_rs=id_ex[19:15];
assign t_id_ex_rt=id_ex[14:10];
//wire [31:0]extend_off;
ALU_control ac(.ALU_op(id_ex[124:123]),.func(id_ex[57:52]),.op(op));

forwarding_unit fu(.ex_mem_rd(ex_mem_rd),.mem_wb_rd(mem_wb_rd),.id_ex_rs(t_id_ex_rs),
.id_ex_rt(t_id_ex_rt),.mem_wb_regwrite(mem_wb_regwrite),.ex_mem_regwrite(ex_mem_regwrite),
.fa(fa),.fb(fb)
);
assign id_ex_memread=id_ex[126];
//assign extend_off={
assign data1=(fa==2)?ex_mem_data:((fa==1)?mem_wb_data:id_ex[121:90]);
assign data2p=(fb==2)?ex_mem_data:((fb==1)?mem_wb_data:id_ex[89:58]);
assign data2=id_ex[122]?id_ex[51:20]:data2p;
ALU a(.op(op),.data1(data1),.data2(data2),.result(result));

assign dest=id_ex[125]?id_ex[4:0]:id_ex[9:5];
assign w_data=((t_id_ex_rt==mem_wb_rd)&id_ex[127])?mem_wb_data:id_ex[89:58];
always@(posedge clk or posedge rst)
begin
if(rst) ex_mem<=0;
else ex_mem<={id_ex[129:126],result,w_data,dest};
end
endmodule
