//module wrapper_crc8
//(
//  input  logic        p_clk_i,
//  input  logic        p_rst_i,
//  input  logic [31:0] p_dat_i,
//  output logic [31:0] p_dat_o,
//  input  logic        p_sel_i,
//  input  logic        p_enable_i,
//  input  logic        p_we_i,
//  input  logic [31:0] p_adr_i,
//  output logic        p_ready
//);

//    localparam CRC_WR_ADDR = 4'h0; // CRC write address
//    localparam CRC_RD_ADDR = 4'h4; // CRC read address

//    // Local wires for crc connection
//    logic [7:0] din_i;
//    logic [7:0] crc_o;
//    logic       crc_rd;
//    logic       data_valid_i;

//    crc8 i_crc8 (
//        .clk_i        ( p_clk_i      ),
//        .rst_i        ( !p_rst_i     ),
//        .din_i        ( din_i        ),
//        .data_valid_i ( data_valid_i ),
//        .crc_rd       ( crc_rd       ),
//        .crc_o        ( crc_o        )
//    );

//    logic cs_1_ff;
//    logic cs_2_ff;

//    // ------ Формирование строба cs цикла чтения или записи по системной шине ------
//    always_ff @ (posedge p_clk_i) begin
//        cs_1_ff <= p_enable_i & p_sel_i;
//        cs_2_ff <= cs_1_ff;
//    end

//    logic cs;
//    assign cs = cs_1_ff & (~cs_2_ff);

//    // ------ Формирование выходных данных системной шины ------
//    always_comb begin
//        //Для чтения crc используем адрес 1
//        if (cs & (~p_we_i) & (p_adr_i[3:0] == 4'd4))
//            p_dat_o <= {24'd0, crc_o};
//    end

//    // ------ Формирование сигналов на модуль-вычислитель ------
//    //Для записи данных для расчета crc используем адрес 0
//    assign data_valid_i = (cs &  p_we_i & (p_adr_i[3:0] == CRC_WR_ADDR));
//    assign din_i = (cs & p_we_i & (p_adr_i[3:0] == CRC_WR_ADDR));

//    //Для чтения crc используем адрес 4
//    assign crc_rd = (cs & ~p_we_i & (p_adr_i[3:0] == CRC_RD_ADDR));

//    // ------ Формирование сигнала p_ready------
//    logic cs_ack1_ff;
//    logic cs_ack2_ff;

//    // Формирование сигнала готовности системной шины p_ready
//    always_ff @ (posedge p_clk_i) begin
//        cs_ack1_ff <= cs_2_ff;
//        cs_ack2_ff <= cs_ack1_ff;
//    end

//    logic p_ready_ff;

//    always_ff @ (posedge p_clk_i) begin
//        p_ready_ff <= (cs_ack1_ff & (~cs_ack2_ff));
//    end
//endmodule