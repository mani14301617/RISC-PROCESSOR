`timescale 1ns / 1ps
module ALU(
input [2:0]op,
input [31:0]data1,
input [31:0]data2,
output [31:0] result
);
wire [31:0]add_sub,AND_OR,slt;
wire [31:0]t,s,v;
assign s=data1^{32{op[0]}};
assign v=data2^{32{op[0]}};
assign t=(data2^{32{op[2]}});
assign add_sub=data1+t+op[2];
assign AND_OR=(s&v)^{32{op[0]}};
assign slt=(data1<data2)?1:0;
assign result=(op[1]&(~op[0]))?add_sub:((~op[2])&(~op[1])?AND_OR:(op[2]&op[1]&op[0]?slt:0));

endmodule
