`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 01:03:07
// Design Name: 
// Module Name: tb_pow5_mult_single_cycle
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


module tb_pow5_mult_single_cycle();

    parameter DATA_WIDTH = 4;
    parameter PERIOD = 20;

    logic clk;
    logic rst;
    logic [DATA_WIDTH-1:0]      data_i;
    logic [(5*DATA_WIDTH)-1:0]  data_o;
    

    initial begin
        clk = 1'b0;
        #(PERIOD/2);
        forever
            #(PERIOD/2) clk = ~clk;
    end

    pow5_mult_single_cycle
    #(
        .DATA_WIDTH(DATA_WIDTH)
    )
    pow5_inst 
    (
        .clk_i(clk),
        .rst_i(rst),
        .pow_data_i(data_i),
        .pow_data_o(data_o)
    );
    
    initial begin
        rst = 1;
        #PERIOD;
        rst  = 0;
        #PERIOD;
        data_i = 3;
        #PERIOD;
        data_i = 5;
        #PERIOD;
         data_i = 2;
        #PERIOD;
         data_i = 1;
        #PERIOD;
         data_i = 4;
        #PERIOD;
         data_i = 5;
    end
endmodule
