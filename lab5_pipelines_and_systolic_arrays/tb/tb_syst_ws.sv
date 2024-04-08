`timescale 1ns/1ns

module tb_syst_ws ();

    localparam      PERIOD = 20;
    localparam      RANDOM_SEED = 147;
    localparam      NUM_OF_TESTS = 5;

    logic           CLK;
    logic           RST;

    logic [7:0]     X1;
    logic [7:0]     X2;
    logic [7:0]     X3;

    logic [18:0]    Y1;
    logic [18:0]    Y2;

    // Systolic array instance
    syst_ws syst_array_23 (
        .clk_i(CLK),
        .rst_i(RST),

        .x1_i(X1),
        .x2_i(X2),
        .x3_i(X3),
        
        .y1_o(Y1),
        .y2_o(Y2)
    );

    // Clock generating
    initial begin
        CLK = 1'b0;
        #(PERIOD/2);
        forever
            #(PERIOD/2) CLK = ~CLK;
    end

    // Reset generator
    task reset_gen();

        begin
            RST = 'b1;
            @(posedge CLK);
            RST = 'b0;
        end
    endtask

    // stimulus generator
    task stimulus_gen(integer num_of_gens = 1);
        integer i;
        for(i = 0; i < num_of_gens; i = i + 1) begin
            @(posedge CLK);
            X1 = $urandom; 
            X2 = $urandom;
            X3 = $urandom;
        end
    endtask

    // Main initial block
    initial begin
        $srandom(RANDOM_SEED);
        reset_gen();
        #(PERIOD/2);
        X1 = 1;
        X2 = 2;
        X3 = 3;
        #(PERIOD/2);
        X1 = 4;
        X2 = 5;
        X3 = 6;
        #(PERIOD/2);
        X1 = -1;
        X2 = -2;
        X3 = -3;        
        #(PERIOD/2);
        stimulus_gen(NUM_OF_TESTS);
    end
endmodule