`timescale 1ns / 1ps
module ALU_control(
input [1:0]ALU_op,
input [5:0]func,
output [2:0]op
);

assign op[0]=(ALU_op[1]&(~ALU_op[0])&((func[3]&(~func[2])&func[1]&(~func[0]))|(func[2]&(~func[3])&func[0]&(~func[1]))));
assign op[1]=(~ALU_op[1])|((ALU_op[1]&(~ALU_op[0]))&(func[1]|(~func[3]))&((~func[2])&(~func[0])));
assign op[2]=((~ALU_op[1])&ALU_op[0])|((~ALU_op[0])&ALU_op[1]&(~func[2])&func[1]&(~func[0]));
endmodule
