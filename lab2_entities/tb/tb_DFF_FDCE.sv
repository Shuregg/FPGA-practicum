`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 14:39:13
// Design Name: 
// Module Name: tb_DFF_FDCE
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


module tb_DFF_FDCE();

    localparam NUM_OF_TESTS = 50*200;
    localparam RANDOM_SEED = 323;
    
    logic [6:0] CE_prob;
    logic [6:0] CLR_prob;
    
    integer i;
    integer j;
    integer err_cnt = 0;
    
    logic CE;
    logic CLK;
    logic CLR;
    logic D;
    logic Q_ent;
    logic Q_test;

    DFF_FDCE DFF_FDCE_inst (
        .clk_i      (CLK),
        .arst_i     (CLR),
        .clk_en_i   (CE),
        .data_i     (D),
        .data_o     (Q_ent)
    );
    
    DFF_test DFF_test_inst (
        .clk_i      (CLK),
        .arst_i     (CLR),
        .clk_en_i   (CE),
        .data_i     (D),
        .data_o     (Q_test)
    );
    
   parameter PERIOD = 20;

    initial begin
        CLK = 1'b0;
        #(PERIOD/2);
        forever
            #(PERIOD/2) CLK = ~CLK;
    end
    
    task reset_global();
        begin
            CLR = 'b1;
            @(posedge CLK);
            CLR = 'b0;
            CE  = 'b1;
        end
    endtask
    
    task stimulus_gen();
        begin
            D = $urandom;
            CLR_prob = $urandom_range(0, 100);
            if(CLR_prob <= 'd10) begin
                CLR = 'b1;
            end else begin
                CLR = 'b0;
            end
            CE_prob = $urandom_range(0, 100);
            if(CE_prob >= 'd90) begin
                CE = 'b1;
            end else begin
                CE = 'b0;
            end

        end
    endtask
      
    initial begin
        $srandom(RANDOM_SEED);
        // Wait until FDCE wake up
        for(i = 0; i < 100; i = i + 1) begin
            @(posedge CLK);
        end
        reset_global();
        for(j = 0; j < NUM_OF_TESTS; j = j + 1) begin
            @(posedge CLK);
            stimulus_gen();
        end
    end
endmodule