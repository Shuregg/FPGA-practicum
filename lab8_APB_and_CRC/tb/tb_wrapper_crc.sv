module tb_wrapper_crc ();

    localparam PERIOD = 10;

    localparam CRC_WR_ADDR    = 32'h0;
    localparam CRC_RD_ADDR    = 32'h4;
    localparam CRC_STATE_ADDR = 32'h8;
    localparam CRC_TYPE_ADDR  = 32'hC;

    logic        p_clk_i;
    logic        p_rst_i;
    logic [31:0] p_dat_i;
    logic [31:0] p_dat_o;
    logic        p_enable_i;
    logic        p_sel_i;
    logic        p_we_i;
    logic [31:0] p_adr_i;
    logic        p_ready;

    wrapper_crc_v2 dut_wrapper_crc (
        .p_clk_i    ( p_clk_i    ),
        .p_rst_i    ( p_rst_i    ),
        .p_dat_i    ( p_dat_i    ),
        .p_dat_o    ( p_dat_o    ),
        .p_enable_i ( p_enable_i ),
        .p_sel_i    ( p_sel_i    ),
        .p_we_i     ( p_we_i     ),
        .p_adr_i    ( p_adr_i    ),
        .p_ready    ( p_ready    )
    );

    // Reset initial block
    initial begin
        p_dat_i    = 'hz;
        p_enable_i = 0;
        p_sel_i    = 0;
        p_we_i     = 'hz;
        p_adr_i    = 'hz;
        p_rst_i    = 1;
        repeat(2)
          @(posedge p_clk_i);
        p_rst_i    = 0;
    end

    // clock gen initial block
    initial begin
        p_clk_i = 0;
        forever #(PERIOD/2)
            p_clk_i = ~p_clk_i;
    end

    // Main initial block
    initial begin
      wait(~p_rst_i); // wait for reset done

      $display("Press \"Run all\" button."); $stop();

      $display("===================== Operations with CRC8 =====================");
      @(posedge p_clk_i);
      read_register(CRC_STATE_ADDR);

      @(posedge p_clk_i);
      write_register(CRC_WR_ADDR, 32'hAA);

      @(posedge p_clk_i);
      read_register (CRC_RD_ADDR);

      @(posedge p_clk_i);
      write_register(CRC_WR_ADDR, 32'h33);

      @(posedge p_clk_i);
      read_register (CRC_RD_ADDR);

      // Check crc type
      @(posedge p_clk_i);
      read_register(CRC_TYPE_ADDR);

      $display("===================== Operations with CRC16 =====================");

      // Change CRC8 to CRC16
      @(posedge p_clk_i);
      write_register(CRC_TYPE_ADDR, 32'b1);

      @(posedge p_clk_i);
      read_register (CRC_TYPE_ADDR);

      @(posedge p_clk_i);
      write_register(CRC_WR_ADDR, 32'hAA);

      @(posedge p_clk_i);
      read_register (CRC_RD_ADDR);

      @(posedge p_clk_i);
      write_register(CRC_WR_ADDR, 32'h33);

      @(posedge p_clk_i);
      read_register (CRC_RD_ADDR);

      @(posedge p_clk_i);

      $finish();
    end

    task write_register; // Название task
      input [31:0] reg_addr; // Параметры передаваемые в task, в нашем случае адрес и данные
      input [31:0] reg_data;
      begin
        @ (posedge p_clk_i); // Ожидаем один такт

        // Формируем посылку согласно документации на APB
        p_adr_i    = reg_addr; // Выставляем значения на шины адреса и данных
        p_dat_i    = reg_data;
        p_enable_i = 0;
        p_sel_i    = 1;
        p_we_i     = 1;

        @ (posedge p_clk_i); // Ожидаем один такт

        p_enable_i = 1;

        wait (p_ready); // Ожидаем появление сигнала p_ready

        // Вывод информации о совершенной операции
        $display("(%0t) Writing register [%0d] = 0x%0x", $time, p_adr_i, reg_data);
        @ (posedge p_clk_i);

        // Возвращаем сигналы в исходное состояние
        p_adr_i    = 'hz;
        p_dat_i    = 'hz;
        p_enable_i = 0;
        p_sel_i    = 0;
        p_we_i     = 'hz;
      end
    endtask : write_register

    task read_register;
      input [31:0] reg_addr;
      begin
        @ (posedge p_clk_i);

        p_adr_i    = reg_addr;
        p_enable_i = 0;
        p_sel_i    = 1;
        p_we_i     = 0;

        @ (posedge p_clk_i);

        p_enable_i = 1;

        // correct display
        @(negedge p_clk_i);
        $display("(%0t) Reading register [%0d] = 0x%0x", $time, p_adr_i, p_dat_o);

        wait (p_ready);

        // old display
        // $display("(%0t) Reading register [%0d] = 0x%0x", $time, p_adr_i, p_dat_o);

        @ (posedge p_clk_i);

        p_adr_i    = 'hz;
        p_enable_i = 0;
        p_sel_i    = 0;
        p_we_i     = 'hz;
      end
    endtask : read_register

endmodule