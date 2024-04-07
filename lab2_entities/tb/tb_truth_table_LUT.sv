module tb_truth_table_LUT();

    localparam RANDOM_SEED  = 322;
    localparam NUM_OF_TESTS = 1000;
    
    integer i = 0;
    integer err_cnt = 0;

    logic   [3:0]   A;
    logic   [3:0]   B;
    logic   [3:0]   C;
    logic   [3:0]   Y;
    logic   [3:0]   Y_ref;
    
    assign Y_ref = A & B & C;
    
    truth_table_LUT DUT(
        .a(A),
        .b(B),
        .c(C),
        .y(Y)
    );
    
    task stimulus_gen();
        begin
            A = $urandom();
            B = $urandom();
            C = $urandom();
        end
    endtask
    
    initial begin
        $srandom(RANDOM_SEED);
        for(i = 0; i < NUM_OF_TESTS; i = i + 1) begin
            #10; stimulus_gen();
            if(Y !== Y_ref) begin
                err_cnt = err_cnt + 1;
                $display("\n i=%d, t=%0t, Result: %0b, Expected: %0b", i, $time(), Y, Y_ref);
            end 
        end
        if(err_cnt == 0)
            $display("\nSUCCESS! DUT works correctly.");
        else
            $display("\nFAILURE! DUT doesn't work correctly.\n The total number of errors: %d", err_cnt);
    end
endmodule