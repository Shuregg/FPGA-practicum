`timescale 1ns / 1ps

module wrapper_crc_v2
(
  input  logic        p_clk_i,
  input  logic        p_rst_i,
  input  logic [31:0] p_dat_i,
  output logic [31:0] p_dat_o,
  input  logic        p_sel_i,
  input  logic        p_enable_i,
  input  logic        p_we_i,
  input  logic [31:0] p_adr_i,
  output logic        p_ready,
  output logic        p_slverr
);

  localparam IS_CRC8        = 'b0;
  localparam IS_CRC16       = 'b1;

  localparam CRC_WR_ADDR    = 4'h0;
  localparam CRC_RD_ADDR    = 4'h4;
  localparam CRC_STATE_ADDR = 4'h8;
  localparam CRC_TYPE_ADDR  = 4'hC;

  logic [7:0] crc8_din_i;
  logic [7:0] crc8_crc_o;
  logic [1:0] crc8_state;
  logic       crc8_crc_rd;
  logic       crc8_data_valid_i;

  logic [7:0] crc16_din_i;
  logic [7:0] crc16_crc_o;
  logic [1:0] crc16_state;
  logic       crc16_crc_rd;
  logic       crc16_data_valid_i;

  logic is_writing;
  logic is_reading;

  logic crc_type_ff;
  logic crc_type;

  assign p_slverr = 1'b0;
  assign crc_type = crc_type_ff;

  crc8 i_crc8 (
    .clk_i        (p_clk_i),
    .rst_i        (!p_rst_i),
    .din_i        (crc8_din_i),
    .data_valid_i (crc8_data_valid_i),
    .crc_rd       (crc8_crc_rd),
    .state_o      (crc8_state),
    .crc_o        (crc8_crc_o)
  );

  crc16 i_crc16 (
    .clk_i        (p_clk_i),
    .rst_i        (!p_rst_i),
    .din_i        (crc16_din_i),
    .data_valid_i (crc16_data_valid_i),
    .crc_rd       (crc16_crc_rd),
    .state_o      (crc16_state),
    .crc_o        (crc16_crc_o)
  );

  logic cs_1_ff;
  logic cs_2_ff;

  logic cs_ack1_ff;
  logic cs_ack2_ff;

  always_ff @ (posedge p_clk_i)
  begin
      cs_1_ff <= p_enable_i & p_sel_i;
      cs_2_ff <= cs_1_ff;
  end

  logic cs;
  assign cs = cs_1_ff & (~cs_2_ff);

  always_ff @ (posedge p_clk_i)
  begin
    cs_ack1_ff <= cs_2_ff;
    cs_ack2_ff <= cs_ack1_ff;
  end

  // Generating acknowledge signal
  logic p_ready_ff;

  always_ff @ (posedge p_clk_i)
  begin
    p_ready_ff <= (cs_ack1_ff & (~cs_ack2_ff));
  end

  assign p_ready = p_ready_ff;

  // // original reading
  // always_comb
  // begin
  //   p_dat_o = '0;
  //   if (cs & (~p_we_i) & (p_adr_i[3:0] == 4'd4))
  //     p_dat_o = {24'd0, crc_o};
  //   else if (cs & (~p_we_i)& (p_adr_i[3:0] == 4'd8))
  //     p_dat_o = {24'd0, state};
  // end

  // New reading logic
  always_comb begin
    p_dat_o      = '0;
    crc8_crc_rd  = '0;
    crc16_crc_rd = '0;
    if(is_reading) begin
      case(p_adr_i[3:0])
        CRC_RD_ADDR: begin
          case(crc_type)
            IS_CRC8:  begin
              crc8_crc_rd  = 'b1;
              p_dat_o      = {24'b0, crc8_crc_o};
            end
            IS_CRC16: begin
              crc16_crc_rd = 'b1;
              p_dat_o      = {24'b0, crc16_crc_o};
            end
          endcase
        end
        CRC_STATE_ADDR:
          case(crc_type)
            IS_CRC8:
              p_dat_o = {30'b0, crc8_state};
            IS_CRC16:
              p_dat_o = {30'b0, crc16_state};
          endcase
        CRC_TYPE_ADDR:
          p_dat_o = {31'b0, crc_type};
      endcase
    end
  end

  assign is_writing = cs & p_we_i;
  assign is_reading = cs & (~p_we_i);

  // // Original write
  // assign data_valid_i = (cs & p_we_i & p_adr_i[3:0]  == 4'd0);
  // assign din_i        = (cs & p_we_i & p_adr_i[3:0]  == 4'd0) ? p_dat_i[7:0]: 8'd0;
  // assign crc_rd       = (cs & ~p_we_i & p_adr_i[3:0] == 4'd4);

  // New writing logic
  always_comb begin
    crc8_data_valid_i  = '0;
    crc16_data_valid_i = '0;
    crc8_din_i         = '0;
    crc16_din_i        = '0;

    if(is_writing) begin
      case(p_adr_i[3:0])
        CRC_WR_ADDR: begin
          case(crc_type)
            IS_CRC8: begin
              crc8_data_valid_i  = 'b1;
              crc8_din_i         = p_dat_i[7:0];
            end
            IS_CRC16: begin
              crc16_data_valid_i = 'b1;
              crc16_din_i        = p_dat_i[15:0];
            end
          endcase
        end
        // CRC_TYPE_ADDR: begin

        // end
      endcase
    // end else begin

    end
  end

  always_ff @(posedge p_clk_i) begin
    if(p_rst_i)
      crc_type_ff <= 'b0;
    else if(is_writing && (p_adr_i[3:0] == CRC_TYPE_ADDR))
      crc_type_ff <= p_dat_i[0];
    else
      crc_type_ff <= crc_type_ff;
  end

endmodule