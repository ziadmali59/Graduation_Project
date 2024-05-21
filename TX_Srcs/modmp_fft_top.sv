/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : modmp&fft_top
Dependancy     :
Design doc.    : 
References     : 
Description    : Modulation mapper and fft integration
Owner          : Yahia Ahmed
*/

module modmp_fft_top
    #(
        parameter DATA_WIDTH = 16,
        parameter FRAC_WIDTH  = 12,
        parameter INT_WIDTH   = 4

    ) 
    (
    input   logic                                       i_clk               ,
                                                        i_rst_n             ,
                                                        i_start             ,
    input   wire   signed       [0:0]                   i_din       [0:0]   ,
    input   logic               [2:0]                   i_Qm                ,
    input   logic               [1:0]                   i_n_sc              ,
    output  logic   signed      [DATA_WIDTH-1:0]        o_X_re      [0:11]  ,
    output  logic   signed      [DATA_WIDTH-1:0]        o_X_im      [0:11]  ,
    output  logic                                       o_done
    );

    logic   signed      [DATA_WIDTH-1:0]                t_I;
    logic   signed      [DATA_WIDTH-1:0]                t_Q;
    logic                                               t_done_mdmp,
                                                        t_done_sipo,
                                                        t_done_sipo_d;
    logic   signed      [DATA_WIDTH-1:0]                t_x_re       [0:11] ;
    logic   signed      [DATA_WIDTH-1:0]                t_x_im       [0:11] ;
    logic   signed      [DATA_WIDTH-1:0]                t_x_re_d       [0:11] ;
    logic   signed      [DATA_WIDTH-1:0]                t_x_im_d       [0:11] ;
    logic   signed      [4:0]                           t_limit             ;

modmapper 
    #(
        .DATA_WIDTH                                     (DATA_WIDTH)
    ) 
modmapper_inst 
    (
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_start                                        (i_start),
        .i_din                                          (i_din),
        .i_Qm                                           (i_Qm),
        .o_I                                            (t_I),
        .o_Q                                            (t_Q),
        .o_done                                         (t_done_mdmp)
    );
assign t_limit = (i_n_sc == 2'b00)? 5'd3: ((i_n_sc == 2'b01)? 5'd6: 5'd12);

flexsipo 
    #(
        .DATA_WIDTH                                 (DATA_WIDTH),
        .SHIFT_LENGTH                               (12),
        .IS_COMP                                    (1)
    ) 
flexsipo_inst 
    (
        .i_clk                                      (i_clk),
        .i_rst_n                                    (i_rst_n),
        .i_sin                                      ({t_I, t_Q}),
        .i_start                                    (t_done_mdmp),
        .i_limit                                    (t_limit),
        .o_pout                                     ('{
                                                        {t_x_re[0],  t_x_im[0]},
                                                        {t_x_re[1],  t_x_im[1]},
                                                        {t_x_re[2],  t_x_im[2]},
                                                        {t_x_re[3],  t_x_im[3]},
                                                        {t_x_re[4],  t_x_im[4]},
                                                        {t_x_re[5],  t_x_im[5]},
                                                        {t_x_re[6],  t_x_im[6]},
                                                        {t_x_re[7],  t_x_im[7]},
                                                        {t_x_re[8],  t_x_im[8]},
                                                        {t_x_re[9],  t_x_im[9]},
                                                        {t_x_re[10], t_x_im[10]},
                                                        {t_x_re[11], t_x_im[11]}
                                                    }),
        .o_done                                     (t_done_sipo)
    );

    //outreg
flexreg 
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .ARRAY_SIZE(12)
    ) 
flexreg_inst 
    (
        .i_clk                      (i_clk),
        .i_rst_n                    (i_rst_n),
        .i_clr                      (1'b0),
        .i_wen                      ({12{t_done_sipo}}),
        .i_din_re                   ('{
                                        {t_x_re[0]},
                                        {t_x_re[1]},
                                        {t_x_re[2]},
                                        {t_x_re[3]},
                                        {t_x_re[4]},
                                        {t_x_re[5]},
                                        {t_x_re[6]},
                                        {t_x_re[7]},
                                        {t_x_re[8]},
                                        {t_x_re[9]},
                                        {t_x_re[10]},
                                        {t_x_re[11]}
                                    }),
        .i_din_im                   ('{
                                        {t_x_im[0]},
                                        {t_x_im[1]},
                                        {t_x_im[2]},
                                        {t_x_im[3]},
                                        {t_x_im[4]},
                                        {t_x_im[5]},
                                        {t_x_im[6]},
                                        {t_x_im[7]},
                                        {t_x_im[8]},
                                        {t_x_im[9]},
                                        {t_x_im[10]},
                                        {t_x_im[11]}
                                    }),
        .o_dout_re                  (t_x_re_d),
        .o_dout_im                  (t_x_im_d)
    );

    always_ff @(posedge i_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n)       // Reset condition
            t_done_sipo_d <= 0;
        else
            t_done_sipo_d <= t_done_sipo;
    end

fft3612 
    #(
        .DATA_WIDTH                                     (DATA_WIDTH),
        .FRAC_WIDTH                                     (FRAC_WIDTH),
        .INT_WIDTH                                      (INT_WIDTH)
    ) 
fft3612_inst 
    (
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_start                                        (t_done_sipo_d),
        .i_n_sc                                         (i_n_sc),
        .i_x_re                                         (t_x_re_d),
        .i_x_im                                         (t_x_im_d),
        .o_X_re                                         (o_X_re),
        .o_X_im                                         (o_X_im),
        .o_done                                         (o_done)
    );

endmodule