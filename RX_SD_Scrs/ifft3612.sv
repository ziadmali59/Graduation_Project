/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : ifft3612
Dependancy     :
Design doc.    : 
References     : 
Description    : 3/6/12 IFFT block necessary for SC-FDMA RX
Owner          : Yahia Ahmed
*/

module ifft3612 
#(
      parameter DATA_WIDTH  = 16,
      parameter FRAC_WIDTH  = 12,
      parameter INT_WIDTH   = 4
) 
(
    //ctrl inputs
    input       logic                                 i_clk               ,
                                                      i_rst_n             ,
                                                      i_start             ,
    input       logic [1:0]                           i_n_sc              , // 0 -> 3pt, 1 -> 6pt, 2 -> 12pt

    //input samples
    input       wire signed  [DATA_WIDTH-1:0]        i_x_re       [0:11] ,
    input       wire signed  [DATA_WIDTH-1:0]        i_x_im       [0:11] ,

    //output samples
    output       logic signed  [DATA_WIDTH-1:0]       o_X_re      [0:11]  ,
    output       logic signed  [DATA_WIDTH-1:0]       o_X_im      [0:11]  ,

    output      logic                                 o_done              ,
    output      logic                                 o_puttin            
);

    //parameters
    parameter MEM_NUM       = 6;
    parameter IN_MUX_NUM    = 3;
    parameter BLY_MUX_NUM   = 2;

    //Memories signals
          logic [0:5]                           c_we                ,
                                                c_raddr             ,
                                                c_waddr             ;
          logic signed [2*DATA_WIDTH-1:0]       t_ram_in    [0:MEM_NUM-1]   ;
          logic signed [2*DATA_WIDTH-1:0]       t_ram_out   [0:MEM_NUM-1]   ;
          logic [1:0]                           c_sel_wr    [0:MEM_NUM-1]   ;

    //Twiddle ROM Signals
          logic [1:0]                           c_tw_sign           ;
          logic [2:0]                           c_tw_addr       [0:1]   ; 
          logic signed [2*DATA_WIDTH-1:0]       t_tw_ram_out    [0:1]   ;
          logic signed [DATA_WIDTH-1:0]         t_tw_sign_re    [0:1]   ;
          logic signed [DATA_WIDTH-1:0]         t_tw_sign_im    [0:1]   ;

    //Butterfly unit Signals
          logic                                 c_bly_32            ;
          logic [2:0]                           c_a_sel     [0:1]   ;
          logic signed [DATA_WIDTH-1:0]         t_b_re    [0:2]   ;
          logic signed [DATA_WIDTH-1:0]         t_b_im    [0:2]   ;
          logic signed [DATA_WIDTH-1:0]         t_a_re    [0:2]   ;
          logic signed [DATA_WIDTH-1:0]         t_a_im    [0:2]   ;

    //in mux sigs
          logic [3:0]                           c_in_sel    [0:2]   ;
          logic signed [2*DATA_WIDTH-1:0]       t_in_mux    [0:2]   ;

    //output selection
          //logic [2:0]                           c_out_sel           ;
            logic [DATA_WIDTH-1:0]              t_b_6_re,
                                                t_b_6_im;
            logic                               c_clr_out;
            logic       [11:0]                  c_en_out;

    //in mux for generate
genvar i;
  generate
    for (i = 0; i < IN_MUX_NUM; i = i + 1) 
    begin : in_mux_inst
      flexmux 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .SEL_WIDTH                  (4)
                ) 
      mux_inst
                (
                    .select                     (c_in_sel[i]),
                    .data_in                    ({
                                                    {i_x_re[0],  - i_x_im[0]},
                                                    {i_x_re[1],  - i_x_im[1]},
                                                    {i_x_re[2],  - i_x_im[2]},
                                                    {i_x_re[3],  - i_x_im[3]},
                                                    {i_x_re[4],  - i_x_im[4]},
                                                    {i_x_re[5],  - i_x_im[5]},
                                                    {i_x_re[6],  - i_x_im[6]},
                                                    {i_x_re[7],  - i_x_im[7]},
                                                    {i_x_re[8],  - i_x_im[8]},
                                                    {i_x_re[9],  - i_x_im[9]},
                                                    {i_x_re[10], - i_x_im[10]},
                                                    {i_x_re[11], - i_x_im[11]},
                                                    {2*DATA_WIDTH{1'b0}}, 
                                                    {2*DATA_WIDTH{1'b0}}, 
                                                    {2*DATA_WIDTH{1'b0}}, 
                                                    {2*DATA_WIDTH{1'b0}}
                                                    }), //ht3ok???
                    .data_out                   (t_in_mux[i])
                );
    end
  endgenerate

  //RAM for generate
  generate
    for (i = 0; i < MEM_NUM; i = i + 1) 
    begin : ram_inst
      sdpram 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .ADDR_WIDTH                 (1)
                ) 
      ram_inst 
                (
                    .clk                        (i_clk),
                   // .ena                        (1'b1),
                    //.enb                        (1'b1),
                    .wea                        (c_we[i]),
                    .waddr                      (c_waddr[i]),
                    .raddr                      (c_raddr[i]),
                    .data_in                    (t_ram_in[i]),
                    .data_out                   (t_ram_out[i])
                );
    end
  endgenerate

  //RAM Muxes for generate
  generate
    for (i = 0; i < MEM_NUM; i = i + 1) 
    begin : ram_mux_inst
      flexmux 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .SEL_WIDTH                  (2)
                ) 
      mux_inst
                (
                    .select                     (c_sel_wr[i]),
                    .data_in                    ({{t_b_re[0], t_b_im[0]}, {t_b_re[1], t_b_im[1]}, {t_b_re[2], t_b_im[2]}, {2*DATA_WIDTH{1'b0}}}),
                    .data_out                   (t_ram_in[i])
                );
    end
  endgenerate


  //bly Muxes for generate
  generate
    for (i = 0; i < BLY_MUX_NUM; i = i + 1) 
    begin : bly_mux_inst
      flexmux 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .SEL_WIDTH                  (3)
                ) 
      mux_inst
                (
                    .select                     (c_a_sel[i]),
                    .data_in                    ({t_in_mux[i], t_ram_out[0], t_ram_out[1], t_ram_out[2], t_ram_out[3], t_ram_out[4], t_ram_out[5], {2*DATA_WIDTH{1'b0}}}), //ht3okk??
                    .data_out                   ({t_a_re[i], t_a_im[i]})
                );
    end
  endgenerate

  //tw rom inst

    flexrom3 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .ADDR_WIDTH                 (3)
                ) 
    tw_rom_inst 
                (
                    .i_addr_1                   (c_tw_addr[0]),
                    .i_addr_2                   (c_tw_addr[1]),
                    .o_data_out_1               (t_tw_ram_out[0]),
                    .o_data_out_2               (t_tw_ram_out[1])
                );

  //2's complement calc
  generate
    for (i = 0; i < 2; i = i + 1) 
    begin : comp2s_instances
      comp2s 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH)
                ) 
      comp2s_inst 
                (
                    .i_ctrl                     (c_tw_sign[i]),
                    .i_din_re                   (t_tw_ram_out[i][2*DATA_WIDTH-1:DATA_WIDTH]),
                    .i_din_im                   (t_tw_ram_out[i][DATA_WIDTH-1:0]),
                    .o_dout_re                  (t_tw_sign_re[i]),
                    .o_dout_im                  (t_tw_sign_im[i])
                );
    end
  endgenerate

  assign {t_a_re[2], t_a_im[2]} = t_in_mux[2];

  //3/2 bly

    radix32bly 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .FRAC_WIDTH                 (FRAC_WIDTH),
                    .INT_WIDTH                  (INT_WIDTH)
                ) 
    radix32bly_inst 
                (
                    .i_c_r32                    (c_bly_32),
                    .i_a0_re                    (t_a_re[0]),
                    .i_a0_im                    (t_a_im[0]),
                    .i_a1_re                    (t_a_re[1]),
                    .i_a1_im                    (t_a_im[1]),
                    .i_a2_re                    (t_a_re[2]),
                    .i_a2_im                    (t_a_im[2]),
                    .i_w1_re                    (t_tw_sign_re[0]),
                    .i_w1_im                    (t_tw_sign_im[0]),
                    .i_w2_re                    (t_tw_sign_re[1]),
                    .i_w2_im                    (t_tw_sign_im[1]),
                    .o_b0_re                    (t_b_re[0]),
                    .o_b0_im                    (t_b_im[0]),
                    .o_b1_re                    (t_b_re[1]),
                    .o_b1_im                    (t_b_im[1]),
                    .o_b2_re                    (t_b_re[2]),
                    .o_b2_im                    (t_b_im[2])
                );

/*
//out MUX

    flexmux 
                #(
                    .DATA_WIDTH                 (DATA_WIDTH),
                    .SEL_WIDTH                  (3)
                ) 
    mux_inst
                (
                    .select                     (c_out_sel),
                    .data_in                    ({t_in_mux[0], t_ram_out, 0}), //ht3okk??
                    .data_out                   ({o_X_re, o_X_im})
                );
*/

  ctrller2 ctrl_inst 
                (
                    .i_clk                      (i_clk),
                    .i_rst_n                    (i_rst_n),
                    .i_start                    (i_start),
                    .i_n_sc                     (i_n_sc),
                    .o_we                       (c_we),
                    .o_waddr                    (c_waddr),
                    .o_raddr                    (c_raddr),
                    .o_sel_wr                   (c_sel_wr),
                    .o_tw_sign                  (c_tw_sign),
                    .o_tw_addr                  (c_tw_addr),
                    .o_bly_32                   (c_bly_32),
                    .o_a_sel                    (c_a_sel),
                    .o_in_sel                   (c_in_sel),
                    .o_en_out                   (c_en_out),
                    .o_clr_out                  (c_clr_out),
                    .o_done                     (o_done),
                    .o_puttin                   (o_puttin)
                );

assign t_b_6_re         = (i_n_sc==2'b01)? t_b_re[1] : t_b_re[0];
assign t_b_6_im         = (i_n_sc==2'b01)? t_b_im[1] : t_b_im[0];

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
                    .i_clr                      (c_clr_out),
                    .i_wen                      (c_en_out),
                    .i_din_re                   ({
                                                    t_b_re[0], 
                                                    (i_n_sc==2'b00)? t_b_re[1] : t_b_re[0],
                                                    (i_n_sc==2'b00)? t_b_re[2] : t_b_re[0],
                                                    t_b_6_re,
                                                    t_b_6_re,
                                                    t_b_6_re,
                                                    t_b_re[1],
                                                    t_b_re[1],
                                                    t_b_re[1],
                                                    t_b_re[1],
                                                    t_b_re[1],
                                                    t_b_re[1]
                                                }),
                    .i_din_im                   ({
                                                    - t_b_im[0], 
                                                    - ((i_n_sc==2'b00)? t_b_im[1] : t_b_im[0]),
                                                    - ((i_n_sc==2'b00)? t_b_im[2] : t_b_im[0]),
                                                    - t_b_6_im,
                                                    - t_b_6_im,
                                                    - t_b_6_im,
                                                    - t_b_im[1],
                                                    - t_b_im[1],
                                                    - t_b_im[1],
                                                    - t_b_im[1],
                                                    - t_b_im[1],
                                                    - t_b_im[1]
                                                }),
                    .o_dout_re                  (o_X_re),
                    .o_dout_im                  (o_X_im)
                );


endmodule