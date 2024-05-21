/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : ifft_moddemp_top
Dependancy     :
Design doc.    : 
References     : 
Description    : ifft and Modulation demapper integration
Owner          : Yahia Ahmed
*/

module ifft_moddemp_top
    #(
        parameter DATA_WIDTH = 16,
        parameter FRAC_WIDTH  = 12,
        parameter INT_WIDTH   = 4

    ) 
    (
    input   logic                                       i_clk               ,
                                                        i_rst_n             ,
                                                        i_start             ,
    input   logic               [2:0]                   i_Qm                ,
    input   logic               [1:0]                   i_n_sc              ,
    input   logic   signed      [DATA_WIDTH-1:0]        i_X_re      [0:11]  ,
    input   logic   signed      [DATA_WIDTH-1:0]        i_X_im      [0:11]  ,
    output  wire    signed      [0:0]                   o_dout      [0:0]   ,
   // output  logic                                       o_done              ,
    output  logic                                       o_valid
    );

    logic   signed      [DATA_WIDTH-1:0]                t_I;
    logic   signed      [DATA_WIDTH-1:0]                t_Q;
    logic                                               t_done_ifft,
                                                        t_done_piso,
                                                        t_done_ifft_d,
                                                        t_valid_piso,
                                                        t_done_mddmp;
    //                                                    t_start_d;
    logic   signed      [DATA_WIDTH-1:0]                t_x_re       [0:11] ;
    logic   signed      [DATA_WIDTH-1:0]                t_x_im       [0:11] ;
    //logic   signed      [DATA_WIDTH-1:0]                t_x_re_d       [0:11] ;
    //logic   signed      [DATA_WIDTH-1:0]                t_x_im_d       [0:11] ;
    logic   signed      [4:0]                           t_limit             ;



ifft3612 
#(
        .DATA_WIDTH                                     (DATA_WIDTH),
        .FRAC_WIDTH                                     (FRAC_WIDTH),
        .INT_WIDTH                                      (INT_WIDTH)
) 
ifft3612_inst 
(
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_start                                        (i_start),
        .i_n_sc                                         (i_n_sc),
        .i_x_re                                         (i_X_re),
        .i_x_im                                         (i_X_im),
        .o_X_re                                         (t_x_re),
        .o_X_im                                         (t_x_im),
        .o_done                                         (t_done_ifft)
);

flexpiso_ifft 
#(
        .DATA_WIDTH                                     (DATA_WIDTH),
        .SHIFT_LENGTH                                   (12),
        .IS_COMP                                        (1)
) 
flexpiso_ifft_inst 
(
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_load                                         (t_done_ifft),
        .i_en                                           (t_done_mddmp && t_valid_piso),
        .i_pin                                          ('{     //in reverse order to insure the same order of transmission
                                                        {t_x_re[11],  t_x_im[11]},
                                                        {t_x_re[10],  t_x_im[10]},
                                                        {t_x_re[9],   t_x_im[9]},
                                                        {t_x_re[8],   t_x_im[8]},
                                                        {t_x_re[7],   t_x_im[7]},
                                                        {t_x_re[6],   t_x_im[6]},
                                                        {t_x_re[5],   t_x_im[5]},
                                                        {t_x_re[4],   t_x_im[4]},
                                                        {t_x_re[3],   t_x_im[3]},
                                                        {t_x_re[2],   t_x_im[2]},
                                                        {t_x_re[1],   t_x_im[1]},
                                                        {t_x_re[0],   t_x_im[0]}
                                                        }),
        .i_limit                                        (t_limit),
        .o_sout                                         ('{t_I, t_Q}),
        .o_valid                                        (t_valid_piso),
        .o_done                                         (t_done_piso)
    );
assign t_limit = (i_n_sc == 2'b00)? 5'd3: ((i_n_sc == 2'b01)? 5'd6: 5'd12);

always_ff @(posedge i_clk or negedge i_rst_n) 
    begin
        if (!i_rst_n)       // Reset condition
            t_done_ifft_d <= 0;
        else
            t_done_ifft_d <= t_done_ifft;
    end

moddemppr 
#(
        .DATA_WIDTH                                     (DATA_WIDTH)
) 
moddemppr_inst
(
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_start                                        (t_done_ifft_d || t_valid_piso),
        .i_n_sc                                         (i_n_sc),
        .i_Qm                                           (i_Qm),
        .i_I                                            (t_I),
        .i_Q                                            (t_Q),
        .o_dout                                         (o_dout),
        .o_done                                         (t_done_mddmp),
        .o_valid                                        (o_valid)
);


endmodule