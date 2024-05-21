/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : intplator
Dependancy     :
Design doc.    : 
References     : 
Description    : Removes the CP and performs resampling
Owner          : Yahia Ahmed
*/
module remcp 
    #(
        parameter   DATA_WIDTH = 16,
        parameter   TOTAL_SAMPLES = 16,
        parameter   INT_SAMPLES = 128,
        parameter   ACP_SAMPLES = 138
    ) 
    (
        input      wire signed    [DATA_WIDTH-1:0]    i_re    [0:ACP_SAMPLES-1],
        input      wire signed    [DATA_WIDTH-1:0]    i_im    [0:ACP_SAMPLES-1],
        output     wire signed    [DATA_WIDTH-1:0]    o_re    [0:TOTAL_SAMPLES-1],
        output     wire signed    [DATA_WIDTH-1:0]    o_im    [0:TOTAL_SAMPLES-1]
    );

    parameter CP_VAL = ACP_SAMPLES - INT_SAMPLES;

  deintplator 
    #(
        .DATA_WIDTH                             (DATA_WIDTH),
        .TOTAL_SAMPLES                          (TOTAL_SAMPLES),
        .INT_SAMPLES                            (INT_SAMPLES)
    ) 
  deintplator_inst 
    (
        .i_re                                   (i_re[CP_VAL:ACP_SAMPLES-1]),
        .i_im                                   (i_im[CP_VAL:ACP_SAMPLES-1]),
        .o_re                                   (o_re),
        .o_im                                   (o_im)
    );

endmodule