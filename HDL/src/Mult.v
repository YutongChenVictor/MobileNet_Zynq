`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/27 15:39:18
// Design Name: 
// Module Name: Mult
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

`include "PARAMS.vh"

module Mult(
    input   signed      [`DATA_SIZE - 1:0]          mult_in_1       ,
    input   signed      [`DATA_SIZE - 1:0]          mult_in_2       ,

    output  signed      [`DATA_SIZE - 1:0]          mult_out
    );

wire     [2 * `DATA_SIZE - 1:0]          mult_reg        ;

assign mult_reg = mult_in_1 * mult_in_2;
assign mult_out = mult_reg[`QUAN_SIZE + `DATA_SIZE - 1:`QUAN_SIZE];

endmodule
