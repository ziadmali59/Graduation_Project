module SD_TOP
#(parameter 			                DATA_WIDTH=	16,   
                                        INT_WIDTH=   4,
                                        FRAC_WIDTH=  12,
                                        ACP_SAMPLES = 138
)
(
input  logic	                                   i_clk,
input  logic	                                   i_rst_n,
                                                   i_start,
input  logic                [5:0]                  i_Isc, 
input  wire  signed         [0:0]                  i_din       [0:0]   ,
input  logic                [2:0]                  i_Qm                ,
input  logic                [1:0]                  i_n_sc              ,
input  logic                [2:0]                  i_Irep,

input  logic                [4:0]                  t_u,
input  logic                [1:0]                  sixTone_BaseSequence,
input  logic                [1:0]                  threeTone_BaseSequence,
input  logic                [3:0]                  i_Nsc,
output logic signed         [2*DATA_WIDTH-1:0]     o_ifft16 [15:0],
output logic                                       o_done_ifft16,

output    wire signed    [DATA_WIDTH-1:0]           o_SD_re    [0:ACP_SAMPLES-1],
output    wire signed    [DATA_WIDTH-1:0]           o_SD_im    [0:ACP_SAMPLES-1]
);

//modmapper, fft and sipo signals
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

//fft outputs
logic                                               t_done_fft;
logic   signed      [DATA_WIDTH-1:0]                t_X_re       [0:11] ;
logic   signed      [DATA_WIDTH-1:0]                t_X_im       [0:11] ;


//RM signals
logic signed [15:0]   t_REM_output_REAL[15:0];
logic signed [15:0]   t_REM_output_Imaginary[15:0];
logic                 t_Stop_FFT;
logic                 t_valid_RM;
logic                 t_valid_pilot;
            
//ifft signlas
logic signed [31:0]   t_ifft[15:0];
logic signed [31:0]   t_reg_ifft[15:0];
logic                 t_start_ift16;
logic                 t_reg_valid_RM;
logic                 t_QPSK;

//DMRS signals
logic signed [15:0]   i_DMRS_REAL[11:0];
logic signed [15:0]   i_DMRS_IMAGINARY[11:0];
logic                 i_DMRS_valid;



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
        .DATA_WIDTH                                     (DATA_WIDTH),
        .SHIFT_LENGTH                                   (12),
        .IS_COMP                                        (1)
    ) 
flexsipo_inst 
    (
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_sin                                          ({t_I, t_Q}),
        .i_start                                        (t_done_mdmp),
        .i_limit                                        (t_limit),
        .o_pout                                         ('{
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
        .o_done                                         (t_done_sipo)
    );

    //outreg
flexreg 
    #(
        .DATA_WIDTH                                     (DATA_WIDTH),
        .ARRAY_SIZE                                     (12)
    ) 
flexreg_inst 
    (
        .i_clk                                          (i_clk),
        .i_rst_n                                        (i_rst_n),
        .i_clr                                          (1'b0),
        .i_wen                                          ({12{t_done_sipo}}),
        .i_din_re                                       ('{
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
        .i_din_im                                       ('{
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
        .o_dout_re                                      (t_x_re_d),
        .o_dout_im                                      (t_x_im_d)
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
        .o_X_re                                         (t_X_re),
        .o_X_im                                         (t_X_im),
        .o_done                                         (t_done_fft)
    );


always_comb begin
for(int i=0;i<16;i++) begin
t_ifft[i]={t_REM_output_REAL[i],t_REM_output_Imaginary[i]};
end
end
DMRS n_DMRS (
.u                                                      (t_u),
.i_Isc                                                  (i_Isc),
.sixTone_BaseSequence                                   (sixTone_BaseSequence),
.threeTone_BaseSequence                                 (threeTone_BaseSequence),
.i_Nsc                                                  (i_Nsc),
//.i_start                                                (t_done_fft),
.i_rst_n                                                (i_rst_n), 
.o_valid                                                (i_DMRS_valid),
.o_DMRS_Real                                            (i_DMRS_REAL),
.o_DMRS_Imaginary                                       (i_DMRS_IMAGINARY)
);
RM_Top RM
    (
        .i_clk                                           (i_clk),
        .i_rst_n                                         (i_rst_n),
        .i_Isc                                           (i_Isc),
        .i_FFT_Valid                                     (t_done_fft),
        .i_FFT_REAL                                      (t_X_re),
        .i_Irep                                          (i_Irep),
        .i_FFT_IMAGINARY                                 (t_X_im),
        .i_DMRS_REAL                                     (i_DMRS_REAL),
        .i_DMRS_IMAGINARY                                (i_DMRS_IMAGINARY),
        .i_DMRS_valid                                    (i_DMRS_valid),
        .o_REM_output_REAL                               (t_REM_output_REAL),
        .o_REM_output_Imaginary                          (t_REM_output_Imaginary),
        .o_valid_RM                                      (t_valid_RM),
        .o_Stop_FFT                                      (t_Stop_FFT), //??? the rest of the chain should be stopped also
        .o_valid_pilot                                   (t_valid_pilot)
    );

//for the shift reg before ifft16 (for the QPSK case)
always_comb begin
if(i_Qm==3'b010) begin //QPSK
    t_QPSK         = 1;
    t_start_ift16  = t_reg_valid_RM;
end
else begin
    t_start_ift16  = t_valid_RM;
    t_QPSK         = 0;
end 
end


reg_bef_16ifft
#(
      .DATA_WIDTH                                        (DATA_WIDTH)
)
reg1 
(
      .i_clk                                              (i_clk),     
      .i_rst_n                                            (i_rst_n),
      .i_wen                                              (t_valid_RM),
      .i_pilot                                            (t_valid_pilot),
      .i_out_RM                                           (t_ifft), 
      .o_in_ifft16                                        (t_reg_ifft)
);

//shiftreg_bet_RM_ifft
//#(
//      .DATA_WIDTH                                        (DATA_WIDTH), 
//      .ARRAY_SIZE                                        (16),
//      .number_of_shifts                                  (15)
//)
//shiftreg
//(
//        .i_clk(i_clk),
//        .i_rst_n(i_rst_n),
//        .i_valid_RM(t_valid_RM),
//    //    .i_din_re   () ,
//    //    .i_din_im   () ,
//    //    .o_dout_re  () ,
//    //    .o_dout_im  (),
//        .o_valid_RM (t_reg_valid_RM)
//);


top_ifft16 
    #( 	    
      .DATA_WIDTH                                        (DATA_WIDTH), 
      .DOUBLE_DATA_WIDTH                                 (2*DATA_WIDTH),
      .INT_WIDTH                                         (INT_WIDTH),
      .FRAC_WIDTH                                        (FRAC_WIDTH)
    )
ifft16 
    (
      .i_clk_ifft16                                       (i_clk),     
      .i_rst_n                                            (i_rst_n),
      .i_valid_mapper_control_fft16                       (t_start_ift16),
      .i_ifft16                                           (t_reg_ifft), 
      .o_ifft16                                           (o_ifft16),
      .o_done_ifft16                                      (o_done_ifft16)                                                  
    );

 addcp 
    #(
        .DATA_WIDTH   (DATA_WIDTH),  
        .TOTAL_SAMPLES(16),
        .INT_SAMPLES  (128), 
        .ACP_SAMPLES  (138)
    ) 
 addcp (
        .i_re   ('{
            o_ifft16[0][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[1][2*DATA_WIDTH-1:DATA_WIDTH],  
            o_ifft16[2][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[3][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[4][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[5][2*DATA_WIDTH-1:DATA_WIDTH],  
            o_ifft16[6][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[7][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[8][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[9][2*DATA_WIDTH-1:DATA_WIDTH],  
            o_ifft16[10][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[11][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[12][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[13][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[14][2*DATA_WIDTH-1:DATA_WIDTH],
            o_ifft16[15][2*DATA_WIDTH-1:DATA_WIDTH]          
        }),
        .i_im   ('{
            o_ifft16[0][DATA_WIDTH-1:0],
            o_ifft16[1][DATA_WIDTH-1:0],  
            o_ifft16[2][DATA_WIDTH-1:0],
            o_ifft16[3][DATA_WIDTH-1:0],
            o_ifft16[4][DATA_WIDTH-1:0],
            o_ifft16[5][DATA_WIDTH-1:0],  
            o_ifft16[6][DATA_WIDTH-1:0],
            o_ifft16[7][DATA_WIDTH-1:0],
            o_ifft16[8][DATA_WIDTH-1:0],
            o_ifft16[9][DATA_WIDTH-1:0],  
            o_ifft16[10][DATA_WIDTH-1:0],
            o_ifft16[11][DATA_WIDTH-1:0],
            o_ifft16[12][DATA_WIDTH-1:0],
            o_ifft16[13][DATA_WIDTH-1:0],
            o_ifft16[14][DATA_WIDTH-1:0],
            o_ifft16[15][DATA_WIDTH-1:0]           
        }),
        .o_re   (o_SD_re),
        .o_im   (o_SD_im)
    );
endmodule