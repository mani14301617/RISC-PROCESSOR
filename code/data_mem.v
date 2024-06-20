`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2024 18:07:36
// Design Name: 
// Module Name: data_mem
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


module data_mem(
input [31:0]address,
input [31:0]write_data,
input mem_write,
input mem_read,
output [31:0]data
    );
    reg [31:0]data_memory[0:30];
    initial 
    begin
    data_memory[0]=0;
    data_memory[1]=32'h0000_0003;
    data_memory[2]=32'h0001_1034;
    data_memory[3]=32'h0400_1004;
    data_memory[4]=32'h00AB_0034;
    data_memory[5]=32'h1210_1200;
    data_memory[6]=32'h0DC0_1001;
    data_memory[7]=32'h008A_0000;
    data_memory[8]=32'h000B_1200;
    data_memory[9]=32'h0010_1000;
    data_memory[10]=32'h0011_1334; 
    data_memory[11]=32'h0011_1334; 
    data_memory[12]=32'h0000_0001; 
    data_memory[13]=32'h0000_0003; 
    data_memory[14]=32'h0011_1334; 
    data_memory[15]=32'h0011_1334; 
    data_memory[16]=32'h0011_1334; 
    data_memory[17]=32'h0011_1334; 
    data_memory[18]=32'h0011_1334; 
    data_memory[19]=32'h0011_1334; 

          
    end
    
    assign data=mem_read?data_memory[address]:0;
    always@(*)
    begin
    if(mem_write) begin data_memory[address]=write_data; end
    else data_memory[address]=data_memory[address];
    end
endmodule
