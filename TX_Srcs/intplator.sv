/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : intplator
Dependancy     :
Design doc.    : 
References     : 
Description    : Performs interpolation of the 16 samples from the IFFT to 128 samples using ZOH.
Owner          : Yahia Ahmed
*/
module intplator 
#(
    parameter DATA_WIDTH = 16,
    parameter TOTAL_SAMPLES = 16,
    parameter INT_SAMPLES = 128
) 
(
  input     wire signed    [DATA_WIDTH-1:0]    i_re    [0:TOTAL_SAMPLES-1],
  input     wire signed    [DATA_WIDTH-1:0]    i_im    [0:TOTAL_SAMPLES-1],
  output    wire signed    [DATA_WIDTH-1:0]    o_re    [0:INT_SAMPLES-1],
  output    wire signed    [DATA_WIDTH-1:0]    o_im    [0:INT_SAMPLES-1]
);
    parameter INT_FACTOR = INT_SAMPLES / TOTAL_SAMPLES;

  // Generate block to perform zero-order hold interpolation
  generate
    genvar i;
    for (i = 0; i < INT_SAMPLES; i++) begin : inteplate
      // Determine index in original samples utilizing integer division
      int orig_index = $floor(i / INT_FACTOR);

      // Perform zero-order hold interpolation directly in assignment
      assign o_re[i] = i_re[orig_index];
      assign o_im[i] = i_im[orig_index];
    end
  endgenerate

endmodule
