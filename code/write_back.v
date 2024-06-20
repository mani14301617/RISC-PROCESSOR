`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 21:20:00
// Design Name: 
// Module Name: write_back
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


module write_back(
input [70:0]mem_wb,
output [4:0]w_reg,
output [31:0]w_data,
output reg_write,
output [31:0]mem_wb_data,
output [4:0]mem_wb_rd
    );
wire [31:0]data1,data2;
assign w_reg=mem_wb[4:0];
assign data1=mem_wb[36:5];
assign data2=mem_wb[68:37];
assign w_data=mem_wb[70]?data2:data1;
assign reg_write=mem_wb[69];
assign mem_wb_data=w_data;  
assign mem_wb_rd=mem_wb[4:0];  
endmodule
