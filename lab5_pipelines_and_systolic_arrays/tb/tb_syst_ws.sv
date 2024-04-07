`timescale 1ns/1ns

module tb_syst_ws ();

    localparam      PERIOD = 20;

    logic           CLK;
    logic           RST;

    logic [7:0]     X1;
    logic [7:0]     X2;
    logic [7:0]     X3;

    logic [18:0]    Y1;
    logic [18:0]    Y2;

    syst_ws syst_array_23 (
        .clk_i(CLK),
        .rst_i(RST),

        .x1_i(X1),
        .x2_i(X2),
        .x3_i(X3),
        
        .y1_o(Y1),
        .y2_o(Y2)
    );

    initial begin
        CLK = 1'b0;
        #(PERIOD/2);
        forever
            #(PERIOD/2) CLK = ~CLK;
    end
endmodule