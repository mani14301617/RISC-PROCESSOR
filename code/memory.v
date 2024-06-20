`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2024 18:07:15
// Design Name: 
// Module Name: memory
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


module memory(
input [72:0]ex_mem,
output reg [70:0]mem_wb,
output [4:0]ex_mem_rd,
output [31:0]ex_mem_data,
output ex_mem_regwrite,
input clk,
input rst
    );
assign ex_mem_rd=ex_mem[4:0];
assign ex_mem_data=ex_mem[68:37];
assign ex_mem_regwrite=ex_mem[71];
wire [31:0]t_data1,t_data2,rd_data;
assign t_data1=ex_mem[68:37];
assign t_data2=ex_mem[36:5];
wire write,read;
assign write=ex_mem[70];
assign read=ex_mem[69];

data_mem dm(.address(t_data1),.write_data(t_data2),.mem_write(write),.mem_read(read),.data(rd_data));

always@(posedge clk or posedge rst)
begin
if(rst) mem_wb<=0;
else mem_wb<={ex_mem[72:71],rd_data,t_data1,ex_mem_rd};
end   
endmodule
