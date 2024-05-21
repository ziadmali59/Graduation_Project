/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : deintplator
Dependancy     :
Design doc.    : 
References     : 
Description    : Performs Resampling of the interpolated 128 samples
Owner          : Yahia Ahmed
*/
module deintplator 
#(
    parameter DATA_WIDTH = 16,
    parameter TOTAL_SAMPLES = 16,
    parameter INT_SAMPLES = 128
) 
(
  input     wire signed    [DATA_WIDTH-1:0]    i_re    [0:INT_SAMPLES-1],
  input     wire signed    [DATA_WIDTH-1:0]    i_im    [0:INT_SAMPLES-1],
  output    wire signed    [DATA_WIDTH-1:0]    o_re    [0:TOTAL_SAMPLES-1],
  output    wire signed    [DATA_WIDTH-1:0]    o_im    [0:TOTAL_SAMPLES-1]
);
    parameter INT_FACTOR = INT_SAMPLES / TOTAL_SAMPLES;

  // Generate block to perform sampling
  generate
    genvar i;
    for (i = 0; i < TOTAL_SAMPLES; i++) begin : deinteplate
      // Determine index in original samples utilizing integer division
      int samp_index = i*INT_FACTOR;

      // Perform sampling directly in assignment
      assign o_re[i] = i_re[samp_index];
      assign o_im[i] = i_im[samp_index];
    end
  endgenerate

endmodule
