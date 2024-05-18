// NOT WORKING


`timescale 1ns / 1ps

module wrapper_crc
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

  localparam CRC8_CODE  = 'b0;
  localparam CRC16_CODE = 'b1;

  // // Register addresses enum
  // typedef enum logic [7:0] {
  //   // CRC registers addresses
  //   CRC_WR_ADDR     = 'h00,
  //   CRC_RD_ADDR     = 'h04,
  //   CRC_STATE_ADDR  = 'h08, // read only
  //   // Control register address
  //   CRC_TYPE_ADDR   = 'h0C
  // } reg_addr_e;
  localparam CRC_WR_ADDR     = 'h00;
  localparam CRC_RD_ADDR     = 'h04;
  localparam CRC_STATE_ADDR  = 'h08;
  localparam CRC_TYPE_ADDR   = 'h0C;

  // CRC8 internal signals
  logic       [7:0] crc8_din_i;
  logic             crc8_data_valid_i;
  logic             crc8_crc_rd;
  logic       [7:0] crc8_crc_o;
  logic       [1:0] crc8_state_o;

  // CRC16 internal signals
  logic       [15:0] crc16_din_i;
  logic              crc16_data_valid_i;
  logic              crc16_crc_rd;
  logic       [15:0] crc16_crc_o;
  logic       [1:0]  crc16_state_o;

  logic              is_reading;
  logic              is_writing;

  logic              crc_reg_addr;
  // reg_addr_e         crc_reg_addr;

  // CRC type (mode) regiser (CRC8/CRC16)
  logic              crc_type;      // wire
  logic              crc_type_ff;

  assign crc_reg_addr = p_adr_i[7:0];

  // CRC8 calculator instance
  crc8 i_crc8 (
    .clk_i        ( p_clk_i           ),
    .rst_i        ( !p_rst_i          ),
    .din_i        ( crc8_din_i        ),
    .data_valid_i ( crc8_data_valid_i ),
    .crc_rd       ( crc8_crc_rd       ),
    .crc_o        ( crc8_crc_o        ),
    .state_o      ( crc8_state_o      )
  );

  // CRC16 calculator instance
  crc16 i_crc16 (
    .clk_i        ( p_clk_i            ),
    .rst_i        ( !p_rst_i           ),
    .din_i        ( crc16_din_i        ),
    .data_valid_i ( crc16_data_valid_i ),
    .crc_rd       ( crc16_crc_rd       ),
    .crc_o        ( crc16_crc_o        ),
    .state_o      ( crc16_state_o      )
  );

  logic cs_1_ff;
  logic cs_2_ff;

  logic cs_ack1_ff;
  logic cs_ack2_ff;

  always_ff @ (posedge p_clk_i) begin
      cs_1_ff <= p_enable_i & p_sel_i;
      cs_2_ff <= cs_1_ff;
  end

  logic cs;
  assign cs = cs_1_ff & (~cs_2_ff);

  assign is_writing   = cs & p_we_i;     // if it is "Data" phase and "Write" mode
  assign is_reading   = cs & (~p_we_i);  // if it is "Data" phase and "Read" mode (not write)

  always_ff @ (posedge p_clk_i) begin
    cs_ack1_ff <= cs_2_ff;
    cs_ack2_ff <= cs_ack1_ff;
  end

  // Generating acknowledge signal
  logic p_ready_ff;

  always_ff @ (posedge p_clk_i) begin
    p_ready_ff <= (cs_ack1_ff & (~cs_ack2_ff));
  end

  assign p_ready = p_ready_ff;

  // Reading logic
  always_comb begin
    p_dat_o  = '0;
    p_slverr = '0;
    if(is_reading) begin
      case(crc_reg_addr)
        // CRC readable registers
        CRC_RD_ADDR:    p_dat_o = crc_type_ff ? {16'b0, crc16_crc_o  } : {24'b0, crc8_crc_o  };
        CRC_STATE_ADDR: p_dat_o = crc_type_ff ? {30'b0, crc16_state_o} : {30'b0, crc8_state_o};

        // Readable control registers
        CRC_TYPE_ADDR:  p_dat_o = {31'b0, crc_type_ff};

        default: begin
          p_slverr = 'b1;
        end
      endcase
    end
  end

  // Writing logic
  always_ff @ (posedge p_clk_i) begin
    if(is_writing) begin
      case(crc_reg_addr)
        // CRC writable registers
        CRC_WR_ADDR: begin
          case(crc_type_ff)
            CRC8_CODE:    crc8_din_i  <= p_dat_i[ 7:0];
            CRC16_CODE:   crc16_din_i <= p_dat_i[15:0];
          endcase
        end
      endcase
    end
  end

  // Writing logic (with reset for control registers)
  always_ff @(posedge p_clk_i) begin
    if(!p_rst_i) begin
      crc_type <= '0;
    end else begin
      if(is_writing) begin
        if(crc_reg_addr == CRC_TYPE_ADDR)
          crc_type <= p_dat_i[0];
      end
    end
  end

  // Control logic (write)
  always_comb begin
    if(is_writing & (crc_reg_addr == CRC_WR_ADDR)) begin
        case(crc_type_ff)
          CRC8_CODE: begin
            crc8_data_valid_i  = 1;
            crc8_din_i         = 1;
          end
          CRC16_CODE: begin
            crc16_data_valid_i = 1;
            crc16_din_i        = 1;
          end
        endcase
    end else begin
        case(crc_type_ff)
          CRC8_CODE: begin
            crc8_data_valid_i  = 0;
            crc8_din_i         = 0;
          end
          CRC16_CODE: begin
            crc16_data_valid_i = 0;
            crc16_din_i        = 0;
          end
        endcase
    end
  end
  // Comtrol logic (read)
  always_comb begin
    if(is_reading & (crc_reg_addr == CRC_RD_ADDR)) begin
      case(crc_type_ff)
        CRC8_CODE:  crc8_crc_rd  = 1;
        CRC16_CODE: crc16_crc_rd = 1;
      endcase
    end else begin
      case(crc_type_ff)
        CRC8_CODE:  crc8_crc_rd  = 0;
        CRC16_CODE: crc16_crc_rd = 0;
      endcase
    end
  end

  // assign crc8_data_valid_i  = (cs &  p_we_i & crc_reg_addr == CRC_WR_ADDR);
  // assign crc8_din_i         = (cs &  p_we_i & crc_reg_addr == CRC_WR_ADDR) ? p_dat_i[7:0]: 8'd0;
  // assign crc8_crc_rd        = (cs & ~p_we_i & crc_reg_addr == CRC_RD_ADDR);

  // assign crc16_data_valid_i = (cs &  p_we_i & crc_reg_addr == CRC_WR_ADDR);
  // assign crc16_din_i        = (cs &  p_we_i & crc_reg_addr == CRC_WR_ADDR) ? p_dat_i[7:0]: 8'd0;
  // assign crc16_crc_rd       = (cs & ~p_we_i & crc_reg_addr == CRC_RD_ADDR);

endmodule