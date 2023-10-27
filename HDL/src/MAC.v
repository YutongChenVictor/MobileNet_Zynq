`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/27 15:38:28
// Design Name: 
// Module Name: MAC
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

`include "MAC_PARAMS.vh"
`include "PARAMS.vh"

module MAC
#(
    parameter KERNEL_WIDTH  = 3,
    parameter KERNEL_LENGTH = 3
)
(
    input       [`DATA_SIZE * KERNEL_WIDTH * KERNEL_LENGTH - 1:0]       kernel_in       ,
    input       [`DATA_SIZE - 1:0]                                      bias            ,
    input       [`DATA_SIZE * KERNEL_WIDTH * KERNEL_LENGTH - 1:0]       map_in          ,
    output      [`DATA_SIZE - 1:0]                                      mac_out
    );

    reg     [`DATA_SIZE - 1:0]          temp;
    wire     [`DATA_SIZE - 1:0]          multi_data;

    integer i = 0;
    integer data_pos = 0;

    always@(*)begin
        temp <= bias;
        for(i = 0; i < KERNEL_WIDTH * KERNEL_WIDTH; i = i + 1)begin
            data_pos = `DATA_SIZE * (KERNEL_WIDTH * KERNEL_LENGTH - i) - 1;
            temp = temp + multi_data;
        end
    end

    Mult mult_inst(
    .mult_in_1(map_in[data_pos -: `DATA_SIZE]),
    .mult_in_2(kernel_in[data_pos -: `DATA_SIZE]),
    .mult_out(multi_data)
    );
    assign mac_out = temp;
endmodule
