`timescale 1ns / 1ps

module tb_bram_dp_simple_with_byte_en ();

    localparam NUM_OF_TESTS = 50*20;
    localparam RANDOM_SEED = 323;
    parameter PERIOD = 20;
    localparam COL_WIDTH_    = 8;    // Size of Byte
    localparam RAM_ADDR_BITS_ = 10;   // Address length
    localparam NB_COL_        = 4;    // Number of Bytes

//    logic [6:0] WE_prob;
    logic [6:0] EN_prob;
    
    integer err_cnt = 0;
    
    logic                                  CLK_i;
    logic                                  RST_i;
    logic [RAM_ADDR_BITS_-1:0]             WA_i;      // Write address
    logic [RAM_ADDR_BITS_-1:0]             RA_i;      // Read address
    logic [(NB_COL_ * COL_WIDTH_)-1:0]     WD_i;      // Write data
    logic [NB_COL_-1:0]                    WE_i;      // Write enable
    logic                                  EN_i;      // RAM enable
    logic [(NB_COL_ * COL_WIDTH_)-1:0]     RD_o;      // output data

    bram_dp_simple_with_byte_en
    #(
        .COL_WIDTH    (COL_WIDTH_),         // Size of Byte
        .RAM_ADDR_BITS(RAM_ADDR_BITS_),     // Address length
        .NB_COL       (NB_COL_)             // Number of Bytes
    )
    bram_inst 
    (
      .clk_i    (CLK_i),
      .rst_i    (RST_i),
      .wa_i     (WA_i),     // Write address
      .ra_i     (RA_i),     // Read address
      .wd_i     (WD_i),     // Write data
      .we_i     (WE_i),     // Write enable
      .en_i     (EN_i),     // RAM enable
      .rd_o     (RD_o)      // output data
    );

    initial begin
        CLK_i = 1'b0;
        #(PERIOD/2);
        forever
            #(PERIOD/2) CLK_i = ~CLK_i;
    end
    
    task reset_global();
        begin
            RST_i = 'b1;
            @(posedge CLK_i);
            RST_i = 'b0;
        end
    endtask
    
    task stimulus_gen();
        begin
            // WE generate
            WE_i = $urandom;
            
            // WA generate
            WA_i = $urandom;
            
            // RA generate
            RA_i = $urandom;
//            RA_i = WA_i;            

            // WD generate
            WD_i = $urandom;
            
            // EN generate
            EN_prob = $urandom_range(0, 100);
            if(EN_prob >= 'd10) begin
                EN_i = 'b1;
            end else begin
                EN_i = 'b0;
            end
        end
    endtask

    initial begin
        $srandom(RANDOM_SEED);                          // Set random generation seed
        reset_global();
        $stop("Press \"Run All\" button to continue.");
        @(posedge CLK_i);
        WA_i = 5;
        RA_i = 5;
        EN_i = 1;
        WE_i = 4'b1111;
        WD_i = 'hCAFE;
        @(posedge CLK_i);
        WA_i = 5;
        RA_i = 5;
        EN_i = 1;
        WE_i = 4'b0001;
        WD_i = 'h1234;
        @(posedge CLK_i);
        WA_i = 5;
        RA_i = 5;
        EN_i = 1;
        WE_i = 4'b0010;
        WD_i = 'h5678;
        @(posedge CLK_i);
        WA_i = 5;
        RA_i = 5;
        EN_i = 1;
        WE_i = 4'b0100;
        WD_i = 'hFA11;
        for(int i = 0; i < NUM_OF_TESTS; i++) begin
            @(posedge CLK_i);
            stimulus_gen();
        end
        $finish("Verify the results using waveworm diagramm.");
    end
endmodule