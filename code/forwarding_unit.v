`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2024 09:54:17
// Design Name: 
// Module Name: forwarding_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module forwarding_unit(
input [4:0]ex_mem_rd,
input [4:0]mem_wb_rd,
input [4:0]id_ex_rt,
input [4:0]id_ex_rs,
input mem_wb_regwrite,
input ex_mem_regwrite,
output  [1:0]fa,
output  [1:0]fb
    );
 wire a,b,c,d;
 assign a=(ex_mem_rd==id_ex_rs)?1:0;
 assign b=(ex_mem_rd==id_ex_rt)?1:0;
 assign c=(mem_wb_rd==id_ex_rs)?1:0;
 assign d=(mem_wb_rd==id_ex_rt)?1:0;
 
 wire z_a,z_b;
 assign z_a=~(ex_mem_rd==0);
 assign z_b=~(mem_wb_rd==0);
 
 wire A,B,C,D;
 assign A=ex_mem_regwrite&(z_a)&a;
 assign B=ex_mem_regwrite&(z_a)&b;
 assign C=mem_wb_regwrite&(z_b)&c;
 assign D=mem_wb_regwrite&(z_b)&d;

 //assign C1=mem_wb_regwrite&z_b&(~(z_a&ex_mem_regwrite&(~a))&c);
 //assign D1=mem_wb_regwrite&z_b&(~(z_a&ex_mem_regwrite&(~b))&d);
 
 
 assign fa=(C)?2'b01:(A?2'b10:2'b00);
 assign fb=(D)?2'b01:(B?2'b10:2'b00);

endmodule
