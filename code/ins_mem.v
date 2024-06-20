`timescale 1ns / 1ps
module ins_mem (
    input [31:0] pc,
    output  [31:0] ins
);
    parameter mem_size = 1000;
    reg [31:0] i_mem [0:mem_size];

    initial begin
        i_mem[0] = 0;
        i_mem[1] = 32'b100011_01100_01000_0000000000000000;
        i_mem[2] = 32'b100011_01100_01001_0000000000000001;
        i_mem[3] = 32'b000000_01000_01001_01010_00000_100000;
        i_mem[4] = 32'b101011_01100_01010_0000000000000010;
        i_mem[5] = 32'hFFFFFFFF;
    end


   assign ins=i_mem[pc];
           
   
endmodule
