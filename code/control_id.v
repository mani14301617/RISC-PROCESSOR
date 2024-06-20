`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2024 14:46:53
// Design Name: 
// Module Name: control_id
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


module control_id(
input [5:0]c_input,
output [1:0]ALU_op,
output reg_dst,
output jump,
output Mem_read,
output Mem_write,
output MemtoReg,
output ALU_src,
output Reg_Write,
output branch
    );
   assign jump=c_input[1]&(~c_input[0]);
   assign branch=c_input[2];
   assign Mem_read=c_input[0]&c_input[1]&(~c_input[3]);
   assign MemtoReg=Mem_read;
   assign Mem_write=c_input[0]&c_input[1]&c_input[3];
   assign ALU_op={((~c_input[5])&(~c_input[2])),c_input[2]};
   assign ALU_src=c_input[0]&c_input[1];
   assign Reg_Write=~((c_input[5]^c_input[1])|c_input[3]|c_input[2]);
   assign reg_dst=~c_input[1];
    
endmodule
