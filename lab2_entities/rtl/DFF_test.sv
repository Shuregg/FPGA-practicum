`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 16:14:58
// Design Name: 
// Module Name: DFF_test
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


module DFF_test(
    input   logic arst_i,
    input   logic clk_i,
    input   logic clk_en_i,
    input   logic data_i,
    output  logic data_o
    );
    
    always_ff @(posedge clk_i or posedge arst_i) begin
        if(arst_i) begin
            data_o <= 1'b0;
        end else begin
            if(clk_en_i == 1'b0) begin
                data_o <= data_o;
            end else begin
                data_o <= data_i;
            end
        end
    end
endmodule
