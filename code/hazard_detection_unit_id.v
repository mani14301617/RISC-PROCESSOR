`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2024 15:25:05
// Design Name: 
// Module Name: hazard_detection_unit_id
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


module hazard_detection_unit_id(
input id_ex_Mem_read,
input Mem_write,
input [4:0]id_ex_reg_rd,
input [4:0]id_ex_reg_rt,
input [4:0]if_id_reg_rt,
input [4:0]if_id_reg_rs,
output stall
    );
    wire s1,s2;
    assign s1=(id_ex_Mem_read&((id_ex_reg_rt==if_id_reg_rt)|(id_ex_reg_rt==if_id_reg_rs)));
    assign s2=(Mem_write&&((id_ex_reg_rd==if_id_reg_rt)||(id_ex_reg_rd==if_id_reg_rs)));
    assign stall=(s1|s2)?1:0;
    
endmodule
