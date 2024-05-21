/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : SD_RX
Dependancy     :
Design doc.    : 
References     : 
Description    : Remove CP / FFT16 / Resource Demapper / NDMRS / Channel estimation and Equalization / IFFT3612 / Demodulator
Owner          : Martina Magued, Mariam Ahmed, and Yahia Ahmed
*/


module SD_RX
#(parameter 			                          DATA_WIDTH=	16,
                                            INT_WIDTH=   4,
                                            FRAC_WIDTH=  12,
                                            i_Qm=4
)
(
input logic                                  i_clk,
                                             i_rst_n,
input logic signed [2*DATA_WIDTH-1:0]                         t_i_fft16[15:0],// to be removed
//for Estimation  
/////////////////////////////////                                             
//input logic [2:0]                            i_symbol_num, //from 0 to 6  (4=pilot) //from Resource demapper
//input logic  signed [2*DATA_WIDTH-1:0]       i_tx_inv_pilot[11:0],

input logic  signed [DATA_WIDTH-1:0]         i_recip_snr,   //can change size later
input logic                                  t_start_fft16,//to be removed
/////////////////////////////////


//for Inverse_pilot  
/////////////////////////////////
input logic  [4:0]                           u,
input logic  [1:0]                           sixTone_BaseSequence,
input logic  [1:0]                           threeTone_BaseSequence,
input logic  [3:0]                           i_Nsc,
////////////////////////////////
input  logic [5:0]                           i_Isc,


//for ifft3612
///////////////////////////////
input  logic                [1:0]            i_n_sc,
////////////////////////////////


//for modulation demapper  
/////////////////////////////////
output  wire    signed      [0:0]           o_dout      [0:0]   , //serial data out
output  logic                               o_valid  
/////////////////////////////////

);

//16fft
//logic                                                   t_start_fft16;
//logic signed [2*DATA_WIDTH-1:0]                         t_i_fft16[15:0];
logic signed [2*DATA_WIDTH-1:0]                         t_o_fft16[15:0];
logic                                                   t_done_fft16;


//Mariaam//////////////////////
logic signed [DATA_WIDTH-1:0]                           t_REM_output_REAL[11:0];
logic signed [DATA_WIDTH-1:0]                           t_REM_output_Imaginary[11:0];
logic [2:0]                                             t_symbol_num; //from 1 to 7  (4=pilot) //from Resource demapper
logic                                                   t_valid_reg;

///////////////////////////////

//est and equ
logic signed  [DATA_WIDTH-1:0]                          t_inv_pilot_re[11:0];
logic signed  [DATA_WIDTH-1:0]                          t_inv_pilot_im[11:0];
logic signed  [2*DATA_WIDTH-1:0]                        t_est_ch[11:0];
logic         [11:0]                                    t_done_est;
logic                                                   t_done_equ;
logic                                                   t_done_equ_one_symbol;      //before ser to par
logic                                                   t_done_equ_7symbols;


logic signed [2*DATA_WIDTH-1:0]                         t_o_equ [11:0];
logic signed  [2*DATA_WIDTH-1:0]                        t_inv_pilot[11:0];
logic  signed [2*DATA_WIDTH-1:0]                        t_rx[11:0];
logic  signed [2*DATA_WIDTH-1:0]                        t_reg_rx[11:0];
//ifft3612 + piso + modulation demapper signals
logic   signed      [DATA_WIDTH-1:0]                    t_I;
logic   signed      [DATA_WIDTH-1:0]                    t_Q;
logic                                                   t_done_ifft,
                                                        t_done_piso,
                                                        t_done_ifft_d,
                                                        t_valid_piso,
                                                        t_done_mddmp;
//                                                        t_start_d;
logic   signed      [DATA_WIDTH-1:0]                    t_x_re       [0:11] ;
logic   signed      [DATA_WIDTH-1:0]                    t_x_im       [0:11] ;
//logic   signed      [DATA_WIDTH-1:0]                    t_x_re_d       [0:11] ;
//logic   signed      [DATA_WIDTH-1:0]                    t_x_im_d       [0:11] ;
logic   signed      [4:0]                               t_limit             ;

always_comb begin
for(int i=0;i<12;i++) begin
t_inv_pilot[i]={t_inv_pilot_re[i],t_inv_pilot_im[i]};

end

end

always_comb begin
for(int i=0;i<12;i++) begin
t_rx[i]={t_REM_output_REAL[i],t_REM_output_Imaginary[i]};

end
end


 top_fft16
 #(     .DATA_WIDTH(DATA_WIDTH),   
        .INT_WIDTH(INT_WIDTH),
        .FRAC_WIDTH(FRAC_WIDTH))
fft16        
    (
      .i_clk_fft16                                       (i_clk),     
      .i_rst_n                                           (i_rst_n),
      .i_valid_mapper_control_fft16                      (t_start_fft16),
      .i_fft16                                           (t_i_fft16), 
      .o_fft16                                           (t_o_fft16),
      .o_done_fft16                                      (t_done_fft16)                                                  
    );


//Mariaam//////////////////////
Resource_Demapper_Top R_demapper_top(
.i_FFT_REAL('{t_o_fft16[15][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[14][2*DATA_WIDTH-1:DATA_WIDTH],  
            t_o_fft16[13][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[12][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[11][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[10][2*DATA_WIDTH-1:DATA_WIDTH],  
            t_o_fft16[9][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[8][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[7][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[6][2*DATA_WIDTH-1:DATA_WIDTH],  
            t_o_fft16[5][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[4][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[3][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[2][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[1][2*DATA_WIDTH-1:DATA_WIDTH],
            t_o_fft16[0][2*DATA_WIDTH-1:DATA_WIDTH]          
        }),
        .i_FFT_IMAGINARY   ('{
            t_o_fft16[15][DATA_WIDTH-1:0],
            t_o_fft16[14][DATA_WIDTH-1:0],  
            t_o_fft16[13][DATA_WIDTH-1:0],
            t_o_fft16[12][DATA_WIDTH-1:0],
            t_o_fft16[11][DATA_WIDTH-1:0],
            t_o_fft16[10][DATA_WIDTH-1:0],  
            t_o_fft16[9][DATA_WIDTH-1:0],
            t_o_fft16[8][DATA_WIDTH-1:0],
            t_o_fft16[7][DATA_WIDTH-1:0],
            t_o_fft16[6][DATA_WIDTH-1:0],  
            t_o_fft16[5][DATA_WIDTH-1:0],
            t_o_fft16[4][DATA_WIDTH-1:0],
            t_o_fft16[3][DATA_WIDTH-1:0],
            t_o_fft16[2][DATA_WIDTH-1:0],
            t_o_fft16[1][DATA_WIDTH-1:0],
            t_o_fft16[0][DATA_WIDTH-1:0]           
        }),
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_Isc(i_Isc),
        .i_FFT_Valid(t_done_fft16),
        .o_Valid_Count(t_symbol_num),
        .o_REM_output_Imaginary(t_REM_output_Imaginary),
        .o_REM_output_REAL(t_REM_output_REAL),
        .o_valid_reg(t_valid_reg)
        
        );


///////////////////////////////

reg_bef_equ
#(
      .DATA_WIDTH                                        (DATA_WIDTH)
)
reg1 
(
      .i_clk                                              (i_clk),     
      .i_rst_n                                            (i_rst_n),
      .i_wen                                              (t_valid_reg),
     // .i_pilot                                            (t_valid_pilot),
      .i_out_RDM                                           (t_rx), 
      .o_in_equ_est                                        (t_reg_rx)
);


Inverse_pilot inverse_pilot
(
        .u                                             (u),
        .sixTone_BaseSequence                          (sixTone_BaseSequence),
        .threeTone_BaseSequence                        (threeTone_BaseSequence),
        .i_Nsc                                         (i_Nsc),
        .phis_real                                     (t_inv_pilot_re),
        .phis_Imaginary                                (t_inv_pilot_im) 
);



estimation 
#( 			                
        .DATA_WIDTH                                     (DATA_WIDTH), 
        .INT_WIDTH                                      (INT_WIDTH),
        .FRAC_WIDTH                                     (FRAC_WIDTH)                                  
)
est
(
        .i_clk_est                                      (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_symbol_num                                   (t_symbol_num), 
        .i_tx_inv_pilot                                 (t_inv_pilot),
        .i_rx_pilot                                     (t_reg_rx),
        .o_est_ch                                       (t_est_ch),
        .o_est_done                                     (t_done_est)                                                  
);

equalization 
#(
        .DATA_WIDTH                                     (DATA_WIDTH), 
        .INT_WIDTH                                      (INT_WIDTH),
        .FRAC_WIDTH                                     (FRAC_WIDTH)                                  
)
equ
(
        .i_clk_equ                                      (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_h                                            (t_est_ch),  //from estimation
        .i_recip_snr                                    (i_recip_snr),   //can change size later
        .i_rx                                           (t_reg_rx),
        .i_est_done12                                   (t_done_est), //12 bits (1 for each subcarrier) //from block estimation
        .i_symbol_num                                   (t_symbol_num), //from 0 to 6 //from block mariam
        .o_done_equ_one_symbol                          (t_done_equ_one_symbol),      //before ser to par
        .o_equ                                          (t_o_equ),
        .o_done_equ                                     (t_done_equ), //after ser to par (READY!)  
        .o_done_equ_7symbols                            (t_done_equ_7symbols)                                     
);



ifft3612 
#( 	
        .DATA_WIDTH                                     (DATA_WIDTH), 
        .INT_WIDTH                                      (INT_WIDTH),
        .FRAC_WIDTH                                     (FRAC_WIDTH)                                  
)
ifft3612_inst
(
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_start                                        (t_done_equ),
        .i_n_sc                                         (i_n_sc), 
        .i_x_re                                         ('{t_o_equ[0][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[1][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[2][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[3][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[4][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[5][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[6][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[7][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[8][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[9][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[10][2*DATA_WIDTH-1:DATA_WIDTH],
                                                            t_o_equ[11][2*DATA_WIDTH-1:DATA_WIDTH]
                                                          }),
        .i_x_im                                         ('{t_o_equ[0][DATA_WIDTH-1:0],
                                                            t_o_equ[1][DATA_WIDTH-1:0],
                                                            t_o_equ[2][DATA_WIDTH-1:0],
                                                            t_o_equ[3][DATA_WIDTH-1:0],
                                                            t_o_equ[4][DATA_WIDTH-1:0],
                                                            t_o_equ[5][DATA_WIDTH-1:0],
                                                            t_o_equ[6][DATA_WIDTH-1:0],
                                                            t_o_equ[7][DATA_WIDTH-1:0],
                                                            t_o_equ[8][DATA_WIDTH-1:0],
                                                            t_o_equ[9][DATA_WIDTH-1:0],
                                                            t_o_equ[10][DATA_WIDTH-1:0],
                                                            t_o_equ[11][DATA_WIDTH-1:0]
                                                          }),
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