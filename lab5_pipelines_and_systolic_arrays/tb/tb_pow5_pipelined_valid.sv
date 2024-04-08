`timescale 1ns/1ns

module tb_pow5_pipelined_valid_mod;

  localparam DATA_WIDTH = 8;
  localparam PERIOD = 20;
  logic CLK;
  logic RST;
  logic [DATA_WIDTH-1:0] pow_data_i;
  logic data_valid_i;
  
  logic [(5*DATA_WIDTH)-1:0] pow_data_o;
  logic data_valid_o;

  pow5_pipelined_valid #(
    .DATA_WIDTH(DATA_WIDTH)
  ) dut (
    .clk_i(CLK),
    .rst_i(RST),
    .pow_data_i(pow_data_i),
    .data_valid_i(data_valid_i),
    .pow_data_o(pow_data_o),
    .data_valid_o(data_valid_o)
  );

    // Clock generating
    initial begin
        CLK = 1'b0;
        #(PERIOD/2);
        forever
            #(PERIOD/2) CLK = ~CLK;
    end

  initial begin
    CLK        = 0;
    RST        = 1;
    pow_data_i   = 8'h00;
    data_valid_i = 1'b1;

    #10;
    RST = 0;
    #10;

    for (int i = 0; i < 5; i++) begin
      pow_data_i   = pow_data_i + 1'b1;
      data_valid_i = 1'b1;
      #(PERIOD);
    end

    pow_data_i   = $urandom;
    data_valid_i = 1'b0;
    #(10 * PERIOD);
    data_valid_i = 1'b1;
    pow_data_i   = 8'h02;
    #(PERIOD);
    pow_data_i   = $urandom;
    data_valid_i = 1'b0;
    #(10* PERIOD);

    $stop;
  end

endmodule
