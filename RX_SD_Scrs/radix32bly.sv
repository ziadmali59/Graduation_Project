/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : compmul
Dependancy     :
Design doc.    : 
References     : 
Description    : conditional radix 3/2 butterfly unit used in the FFT operation.
                    0 for radix 2
                    1 for radix 3
Owner          : Yahia Ahmed
*/
module radix32bly 
#(
    parameter DATA_WIDTH  = 16,
    parameter FRAC_WIDTH  = 12,
    parameter INT_WIDTH   = 4
) 
(
    input                                           i_c_r32,
    input     logic signed    [DATA_WIDTH-1:0]      i_a0_re,
                                                    i_a0_im,
                                                    i_a1_re,
                                                    i_a1_im,
                                                    i_a2_re,
                                                    i_a2_im,
                                                    i_w1_re,
                                                    i_w1_im,
                                                    i_w2_re,
                                                    i_w2_im,
    output    logic signed    [DATA_WIDTH-1:0]      o_b0_re,
                                                    o_b0_im,
                                                    o_b1_re,
                                                    o_b1_im,
                                                    o_b2_re,
                                                    o_b2_im
);


    //intermediate signals to be radix 2 
    logic                   [DATA_WIDTH-1:0]        t_a2_mod_re,
                                                    t_a2_mod_im,
                                                    t_r2_mod_re,
                                                    t_r2_mod_im,
                                                    t_addsub_mod_re,
                                                    t_addsub_mod_im;
                                                    
                                                     
                                                    


    //intermediate signals after multiplication
    logic                   [DATA_WIDTH-1:0]        t_a1w1_re, 
                                                    t_a1w1_im,
                                                    t_a1w2_re,
                                                    t_a1w2_im,
                                                    t_a2w1_re,
                                                    t_a2w1_im,
                                                    t_a2w2_re,
                                                    t_a2w2_im;


    //MUXes for radix-2 implementation
    assign t_a2_mod_re  = (i_c_r32)? i_a2_re : 0;
    assign t_a2_mod_im  = (i_c_r32)? i_a2_im : 0;

    assign t_r2_mod_re  = (i_c_r32)? i_a1_re : t_a1w1_re;
    assign t_r2_mod_im  = (i_c_r32)? i_a1_im : t_a1w1_im;

    //calc signal zero
    assign o_b0_re = i_a0_re + t_r2_mod_re + t_a2_mod_re;
    assign o_b0_im = i_a0_im + t_r2_mod_im + t_a2_mod_im;

  // Complex multiplier instantiations
  compmul #(DATA_WIDTH, FRAC_WIDTH, INT_WIDTH) cm1 
                            (
                                .i_a_re             (i_a1_re  ),
                                .i_a_im             (i_a1_im  ),
                                .i_b_re             (i_w1_re  ),
                                .i_b_im             (i_w1_im  ),
                                .o_res_re           (t_a1w1_re),
                                .o_res_im           (t_a1w1_im)
                            );

  compmul #(DATA_WIDTH, FRAC_WIDTH, INT_WIDTH) cm2 
                            (
                                .i_a_re             (t_a2_mod_re  ),
                                .i_a_im             (t_a2_mod_im  ),
                                .i_b_re             (i_w2_re  ),
                                .i_b_im             (i_w2_im  ),
                                .o_res_re           (t_a2w2_re),
                                .o_res_im           (t_a2w2_im)
                            );
    
    //addsub for radix-2
    assign t_addsub_mod_re  = (i_c_r32)? (i_a0_re + t_a1w1_re) : (i_a0_re - t_a1w1_re);
    assign t_addsub_mod_im  = (i_c_r32)? (i_a0_im + t_a1w1_im) : (i_a0_im - t_a1w1_im);

    //first sample calc
    assign o_b1_re = t_addsub_mod_re + t_a2w2_re;
    assign o_b1_im = t_addsub_mod_im + t_a2w2_im;
  compmul #(DATA_WIDTH, FRAC_WIDTH, INT_WIDTH) cm3 
                            (
                                .i_a_re             (i_a1_re  ),
                                .i_a_im             (i_a1_im  ),
                                .i_b_re             (i_w2_re  ),
                                .i_b_im             (i_w2_im  ),
                                .o_res_re           (t_a1w2_re),
                                .o_res_im           (t_a1w2_im)
                            );

  compmul #(DATA_WIDTH, FRAC_WIDTH, INT_WIDTH) cm4 
                            (
                                .i_a_re             (t_a2_mod_re  ),
                                .i_a_im             (t_a2_mod_im  ),
                                .i_b_re             (i_w1_re  ),
                                .i_b_im             (i_w1_im  ),
                                .o_res_re           (t_a2w1_re),
                                .o_res_im           (t_a2w1_im)
                            );

    //second sample calc
    assign o_b2_re = i_a0_re + t_a1w2_re + t_a2w1_re;
    assign o_b2_im = i_a0_im + t_a1w2_im + t_a2w1_im;

endmodule
