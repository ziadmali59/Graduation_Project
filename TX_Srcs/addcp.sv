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
module addcp 
    #(
        parameter   DATA_WIDTH = 16,
        parameter   TOTAL_SAMPLES = 16,
        parameter   INT_SAMPLES = 128,
        parameter   ACP_SAMPLES = 138
    ) 
    (
    input     wire signed    [DATA_WIDTH-1:0]    i_re    [0:TOTAL_SAMPLES-1],
    input     wire signed    [DATA_WIDTH-1:0]    i_im    [0:TOTAL_SAMPLES-1],
    output    wire signed    [DATA_WIDTH-1:0]    o_re    [0:ACP_SAMPLES-1],
    output    wire signed    [DATA_WIDTH-1:0]    o_im    [0:ACP_SAMPLES-1]
    );

    wire signed    [DATA_WIDTH-1:0]    t_re    [0:INT_SAMPLES-1];
    wire signed    [DATA_WIDTH-1:0]    t_im    [0:INT_SAMPLES-1];

  intplator 
    #(
        .DATA_WIDTH                             (DATA_WIDTH),
        .TOTAL_SAMPLES                          (TOTAL_SAMPLES),
        .INT_SAMPLES                            (INT_SAMPLES)
    ) 
  intplator_inst 
    (
        .i_re                                   (i_re),
        .i_im                                   (i_im),
        .o_re                                   (t_re),
        .o_im                                   (t_im)
    );

parameter CP_VAL = ACP_SAMPLES - INT_SAMPLES;

assign o_re[0:CP_VAL-1] =   t_re[INT_SAMPLES-CP_VAL:INT_SAMPLES-1];
assign o_im[0:CP_VAL-1] =   t_im[INT_SAMPLES-CP_VAL:INT_SAMPLES-1];


assign o_re[CP_VAL:ACP_SAMPLES-1] =   t_re;
assign o_im[CP_VAL:ACP_SAMPLES-1] =   t_im;

endmodule