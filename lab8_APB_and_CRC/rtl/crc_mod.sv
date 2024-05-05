// Modified CRC proceccing module with additional control register and choise of CRC type

module crc_mod
(
  input  logic       clk_i,
  input  logic       rst_i,
  input  logic [7:0] din_i,
  input  logic       data_valid_i,
  input  logic       crc_rd,
  input  logic [1:0] state,
  input  logic       crc_type_i,
  output logic [7:0] crc_o
);

  // Параметры для состояний автомата
  localparam IDLE  = 2'b00;
  localparam BUSY  = 2'b01;
  localparam READ  = 2'b10;

  // CRC type parameters
  localparam CRC8  = 2'b00;
  localparam CRC16 = 2'b01;

  logic [1:0] state_ff;         // Регистр состояний
  logic [7:0] data_current_ff;  // Текущие данные (сдвиговый регистр)
  logic [3:0] crc_counter_ff;   // Регистр счетчик обработанных бит входного байта данных для состояния вычисления (BUSY)
  logic [7:0] crc_ff;           // Выходные данные CRC
  logic [1:0] crc_mode

  always_ff @(posedge clk_i)
  begin
    if (rst_i) begin // Сигнал сброса - обнуляем все регистры
      state_ff         <= IDLE;
      data_current_ff  <= 8'b0;
      crc_ff           <= 8'b0;
      crc_counter_ff   <= 4'd0;
    end
    else begin
      case (state_ff)
        IDLE:
          begin
            crc_counter_ff <= 4'b0;
            if (data_valid_i) // Если пришли новые данные - переходим
                                    // в состояние вычисления
            begin
              state_ff        <= BUSY;
              data_current_ff <= din_i;
            end
            else if (crc_rd)
              state_ff <= READ; // Если пришел запрос на чтение - переходим в состояние чтения
          end
        BUSY:
          // CRC8: g(x) = x^8 + x^5 + x^4 + 1, cyclic right shift
          // CRC16: g(x) = x^16 + x^12 + x^5 + 1
          begin
            crc_ff[7] <=  crc_ff[0] ^ data_current_ff[0];
            crc_ff[6] <=  crc_ff[7];
            crc_ff[5] <=  crc_ff[6];
            crc_ff[4] <=  crc_ff[5];
            crc_ff[3] <= (crc_ff[0] ^ data_current_ff[0]) ^ crc_ff[4];
            crc_ff[2] <= (crc_ff[0] ^ data_current_ff[0]) ^ crc_ff[3];
            crc_ff[1] <=  crc_ff[2];
            crc_ff[0] <=  crc_ff[1];

            data_current_ff <= {1'b0,data_current_ff[7:1]};
            crc_counter_ff  <= crc_counter_ff + 1'b1;

            if(crc_counter_ff == 4'b0111)
              state_ff <= IDLE;
          end
        READ:
          begin
            crc_ff   <= 8'b0;
            state_ff <= IDLE;
          end
      endcase
    end
  end

  assign crc_o = crc_ff;

endmodule
