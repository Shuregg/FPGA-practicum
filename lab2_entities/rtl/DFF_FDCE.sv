`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 14:29:53
// Design Name: 
// Module Name: DFF_FDCE
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

//D Flip-Flop with Clock Enab;e and Asynchronous Clear
module DFF_FDCE(
    input   logic arst_i,
    input   logic clk_en_i,
    input   logic data_i,
    input   logic clk_i,
    output  logic data_o
    );
    FDCE #(
        .INIT(1'b0)
    ) FDCE_inst (
        .Q  (data_o),
        .C  (clk_i),
        .CE (clk_en_i),
        .CLR(arst_i),
        .D  (data_i)
    );
endmodule
