// BRAM with simple dual ports and byte enable
// Usually large memories like what you are showing are implemented
// as block RAM type resources - dedicated RAM dotted about in the FPGA.
// These resources do not usually support reset - you can reset the output register, but not the array itself.
// If you try and implement a reset signal, the synthesizer will realise
// that it cannot use a dedicated memory and try to implement
// the whole array in dedicated registers - in your case that would be 8192 registers,
// an 8bit 1024:1 multiplexer, and large quantities of address decoding logic.
// It would take a huge amount of resources!
module bram_dp_simple_with_byte_en
#(
  parameter COL_WIDTH     = 8,  // Size of Byte
  parameter RAM_ADDR_BITS = 10, // Address length
  parameter NB_COL        = 4   // Number of Bytes
)
(
  input  logic                                  clk_i,
  input  logic                                  rst_i,
  input  logic [RAM_ADDR_BITS-1:0]              wa_i,      // Write address
  input  logic [RAM_ADDR_BITS-1:0]              ra_i,      // Read address
  input  logic [(NB_COL * COL_WIDTH)-1:0]       wd_i,      // Write data
  input  logic [NB_COL-1:0]                     we_i,      // Write enable
  input  logic                                  en_i,      // RAM enable
  output logic [(NB_COL * COL_WIDTH)-1:0]       rd_o   // output data
);

  localparam RAM_DEPTH = 2**RAM_ADDR_BITS;
  localparam RAM_WIDTH = NB_COL * COL_WIDTH;

  logic [(RAM_WIDTH)-1:0] bram [RAM_DEPTH-1:0];
  logic [(RAM_WIDTH)-1:0] ram_data_ff;

  assign rd_o = ram_data_ff;

   always_ff @(posedge clk_i) begin
     if(rst_i) begin
      ram_data_ff <= {RAM_WIDTH{1'b0}};
     end else begin
       if(en_i) begin
         ram_data_ff <= bram[ra_i];
       end
     end
   end

  generate
    genvar i;
    for (i = 0; i < NB_COL; i = i+1) begin: byte_write
      always_ff @(posedge clk_i) begin
        if (en_i /*&& !rst_i*/) begin
//            ram_data_ff <= bram[ra_i][(i+1)*COL_WIDTH-1:i*COL_WIDTH];                                // Sync Read
          if (we_i[i]) begin
            bram[wa_i][(i+1)*COL_WIDTH-1:i*COL_WIDTH] <= wd_i[(i+1)*COL_WIDTH-1:i*COL_WIDTH]; // Sync Write
          end
        end
      end
    end
  endgenerate
endmodule