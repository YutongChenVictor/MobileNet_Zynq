`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/27 17:06:34
// Design Name: 
// Module Name: tb_MAC
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


`timescale 1ns / 1ps

module tb_MAC;

// Parameters
parameter DATA_SIZE = 8; // 根据您的 `MAC` 模块的 `DATA_SIZE` 进行设置
parameter KERNEL_WIDTH = 3; // 根据您的 `MAC` 模块的参数进行设置
parameter KERNEL_LENGTH = 3; // 根据您的 `MAC` 模块的参数进行设置

// Inputs
reg [DATA_SIZE * KERNEL_WIDTH * KERNEL_LENGTH - 1:0] kernel_in;
reg [DATA_SIZE - 1:0] bias;
reg [DATA_SIZE * KERNEL_WIDTH * KERNEL_LENGTH - 1:0] map_in;

// Outputs
wire [DATA_SIZE - 1:0] mac_out;

// Instantiate the MAC module
MAC #(
    .KERNEL_WIDTH(KERNEL_WIDTH),
    .KERNEL_LENGTH(KERNEL_LENGTH),
    .DATA_SIZE(DATA_SIZE)
) uut (
    .kernel_in(kernel_in),
    .bias(bias),
    .map_in(map_in),
    .mac_out(mac_out)
);

// Stimulus generation
initial begin
    // Initialize inputs
    kernel_in = {9{'d20}}; // Replace with your desired input values
    bias = 8'd128; // Replace with your desired input values
    map_in = {9{'d80}}; // Replace with your desired input values

    // Add some delay to allow the calculation to complete
    #10;

    // Display the results
    $display("kernel_in: %h", kernel_in);
    $display("bias: %h", bias);
    $display("map_in: %h", map_in);
    $display("mac_out: %h", mac_out);
    

end

endmodule

