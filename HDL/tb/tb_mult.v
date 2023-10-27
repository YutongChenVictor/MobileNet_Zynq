`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/27 15:54:00
// Design Name: 
// Module Name: tb_mult
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

module tb_mult;

parameter DATA_SIZE = 8;

// Inputs
reg signed [DATA_SIZE-1:0] mult_in_1;
reg signed [DATA_SIZE-1:0] mult_in_2;

// Outputs
wire signed [DATA_SIZE-1:0] mult_out;

// Instantiate the Mult module
Mult uut (
    .mult_in_1(mult_in_1),
    .mult_in_2(mult_in_2),
    .mult_out(mult_out)
);

// Stimulus generation
initial begin
    // Initialize inputs
    mult_in_1 = 204; // 0.8
    mult_in_2 = 80; // 0.5

    // Add some delay to allow the calculation to complete
    #10;

    // Display the results
    $display("mult_in_1: %d", mult_in_1);
    $display("mult_in_2: %d", mult_in_2);
    $display("mult_out: %d", mult_out);
    

end

endmodule

