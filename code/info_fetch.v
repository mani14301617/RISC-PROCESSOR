`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2024 15:27:50
// Design Name: 
// Module Name: info_fetch
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


module info_fetch(
input stall,
input flush,
input PCsrc,
input clk,
input rst,
input [31:0]pc_b,
output reg[63:0]if_id
    );


reg [31:0]pc,t_pc;
wire [31:0]ins;
//reg [31:0]t_ins;
ins_mem i1(.pc(t_pc),.ins(ins));
always@(posedge clk or posedge rst)
begin
  if(rst) begin if_id<=0; pc<=0;  end 
  else if(flush) begin if_id<={pc,32'h00000000}; pc<=t_pc; end
  else if(stall) begin if_id<=if_id; pc<=pc; end
  else begin  if_id<={t_pc,ins}; pc<=t_pc; end 
end 

always@(*)
begin
  if(rst) begin t_pc=0; end
  //else if(stall) begin t_pc=pc; end  
  else if(PCsrc) begin t_pc=pc_b; end
  else begin t_pc=pc+1;  end
end 
endmodule
