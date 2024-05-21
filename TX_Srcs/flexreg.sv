/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : flexreg
Dependancy     :
Design doc.    : 
References     : 
Description    : used to capture the output of the 3612 fft
Owner          : Yahia Ahmed
*/

module flexreg
#(
  parameter DATA_WIDTH = 16,
  parameter ARRAY_SIZE = 12
)
(
  input     logic                       i_clk,
                                        i_rst_n,
                                        i_clr,
  input     logic [ARRAY_SIZE-1:0]      i_wen,
  input     wire  signed [DATA_WIDTH-1:0]      i_din_re        [0:ARRAY_SIZE-1],
  input     wire  signed [DATA_WIDTH-1:0]      i_din_im        [0:ARRAY_SIZE-1],
  output    logic signed [DATA_WIDTH-1:0]      o_dout_re       [0:ARRAY_SIZE-1],
  output    logic signed [DATA_WIDTH-1:0]      o_dout_im       [0:ARRAY_SIZE-1]
);

	genvar i;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1 ) 
        begin : manyreg
            always_ff @( posedge i_clk or negedge i_rst_n ) begin : reg_out
                if (!i_rst_n)
                begin
                    o_dout_re [i] <= 0;
                    o_dout_im [i] <= 0;
                end
                else if(i_clr)
                begin
                    o_dout_re [i] <= 0;
                    o_dout_im [i] <= 0;
                end
                else if(i_wen[i])
                begin
                    o_dout_re [i] <= i_din_re[i];
                    o_dout_im [i] <= i_din_im[i];
                end
            end
        end
    endgenerate

endmodule
