`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2024 13:09:57
// Design Name: 
// Module Name: register_file
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


module register_file(
input [4:0]r_reg1,
input [4:0]r_reg2,
input [4:0]w_reg,
input [31:0]w_data,
input Reg_Write,
output  [31:0]r_data1,
output  [31:0]r_data2
    );
    reg [31:0]mem[0:50];
    initial
    begin
    mem[0]=0;
    mem[1]=32'h0011_1334;
   mem[2]=32'h0011_1334;
   mem[3]=32'h0010_1304;
   mem[4]=32'h0000_1334;
   mem[5]=32'h0010_1334;
   mem[6]=32'h0011_1334;
   mem[7]=32'h0031_1004;
   mem[8]=32'h0044_1334;
   mem[9]=32'h0033_1334;
   mem[12]=32'h0000_000C;
   mem[13]=32'h0000_000E;
end      
    assign r_data1=mem[r_reg1];
    assign r_data2=mem[r_reg2];
    always@(*)
     mem[w_reg]=Reg_Write?w_data:mem[w_reg];
endmodule
