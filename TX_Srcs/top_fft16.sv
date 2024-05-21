module top_fft16
#(parameter 			                  DATA_WIDTH	=	32,//16,   
                                       DOUBLE_DATA_WIDTH = 2*DATA_WIDTH,//32 //for real and imaginary
                                       INT_WIDTH=8,//4,
                                       FRAC_WIDTH=24//12
)
(
input logic                                       i_clk_fft16,     
                                                  i_rst_n,
                                                  i_valid_mapper_control_fft16,
input logic signed [DOUBLE_DATA_WIDTH-1:0]        i_fft16 [15:0], 
output logic signed [DOUBLE_DATA_WIDTH-1:0]       o_fft16 [15:0],
output logic                                      o_done_fft16                                                  
);

logic                                t_done_rearrange_control_fft16;
logic                                t_en_arrg_control_fft16 ;                                          
logic                                t_wr_en_control_fft16;                                            
logic                                t_done_stage3_control_fft16;

logic                                t_mem_initial_control_fft16;
logic                                t_ready_control_fft16; 

 
logic signed [DOUBLE_DATA_WIDTH-1:0]  t3_to4_allmemories_fft16  [15:0];
                                            
logic                                 t_wr_add_control_fft16;
logic                                 t_rd_add_control_fft16;
logic [5:0]                           t_a_rd_index_control_fft16;   
logic [5:0]                           t_b_rd_index_control_fft16;
logic [2:0]                           t_indx_twid_control_fft16;
logic [2:0]                           t_a_wr_index_control_fft16;
logic [2:0]                           t_b_wr_index_control_fft16;
logic                                 t_done_btrfly_control_fft16;

logic                                 t3_rd_add_control_fft16;
logic [5:0]                           t3_a_rd_index_control_fft16;   
logic [5:0]                           t3_b_rd_index_control_fft16;
logic [2:0]                           t3_indx_twid_control_fft16;

logic                                 t4_rd_add_control_fft16;
logic [5:0]                           t4_a_rd_index_control_fft16;   
logic [5:0]                           t4_b_rd_index_control_fft16;
logic [2:0]                           t4_indx_twid_control_fft16;  

logic                                 t_wr_en_reg_stage4_fft16;
logic [2:0]                           t_a_wr_reg_stage4_fft16;
logic [2:0]                           t_b_wr_reg_stage4_fft16;

                                                
logic                                 t_stage4;
logic                                 t_stage3;
logic                                 t3_rst_ser_to_par;
logic                                 t4_rst_ser_to_par;

logic                                 t_rst_sp;
logic signed [DOUBLE_DATA_WIDTH-1:0]  t_o_fft16 [15:0];


logic signed [1:0]                    t_num_stage3;



//newwwwwwwwww
logic t_start_stage4;
logic t_last_btrfly_stage3;

logic signed [DATA_WIDTH-1:0] t0;
logic signed [DATA_WIDTH-1:0] t1;
logic signed [DATA_WIDTH-1:0] t2;
logic signed [DATA_WIDTH-1:0] t3;
logic signed [DATA_WIDTH-1:0] t4;
logic signed [DATA_WIDTH-1:0] t5;
logic signed [DATA_WIDTH-1:0] t6;
logic signed [DATA_WIDTH-1:0] t7;
logic signed [DATA_WIDTH-1:0] t8;
logic signed [DATA_WIDTH-1:0] t9;
logic signed [DATA_WIDTH-1:0] t10;
logic signed [DATA_WIDTH-1:0] t11;
logic signed [DATA_WIDTH-1:0] t12;
logic signed [DATA_WIDTH-1:0] t13;
logic signed [DATA_WIDTH-1:0] t14;
logic signed [DATA_WIDTH-1:0] t15;

logic signed [DATA_WIDTH-1:0] t0i;
logic signed [DATA_WIDTH-1:0] t1i;
logic signed [DATA_WIDTH-1:0] t2i;
logic signed [DATA_WIDTH-1:0] t3i;
logic signed [DATA_WIDTH-1:0] t4i;
logic signed [DATA_WIDTH-1:0] t5i;
logic signed [DATA_WIDTH-1:0] t6i;
logic signed [DATA_WIDTH-1:0] t7i;
logic signed [DATA_WIDTH-1:0] t8i;
logic signed [DATA_WIDTH-1:0] t9i;
logic signed [DATA_WIDTH-1:0] t10i;
logic signed [DATA_WIDTH-1:0] t11i;
logic signed [DATA_WIDTH-1:0] t12i;
logic signed [DATA_WIDTH-1:0] t13i;
logic signed [DATA_WIDTH-1:0] t14i;
logic signed [DATA_WIDTH-1:0] t15i;





assign t0=o_fft16[0][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t1=o_fft16[1][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t2=o_fft16[2][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t3=o_fft16[3][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t4=o_fft16[4][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t5=o_fft16[5][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t6=o_fft16[6][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t7=o_fft16[7][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t8=o_fft16[8][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t9=o_fft16[9][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t10=o_fft16[10][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t11=o_fft16[11][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t12=o_fft16[12][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t13=o_fft16[13][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t14=o_fft16[14][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t15=o_fft16[15][DOUBLE_DATA_WIDTH-1:DATA_WIDTH];



assign t0i=o_fft16[0][DATA_WIDTH-1:0];
assign t1i=o_fft16[1][DATA_WIDTH-1:0];
assign t2i=o_fft16[2][DATA_WIDTH-1:0];
assign t3i=o_fft16[3][DATA_WIDTH-1:0];
assign t4i=o_fft16[4][DATA_WIDTH-1:0];
assign t5i=o_fft16[5][DATA_WIDTH-1:0];
assign t6i=o_fft16[6][DATA_WIDTH-1:0];
assign t7i=o_fft16[7][DATA_WIDTH-1:0];
assign t8i=o_fft16[8][DATA_WIDTH-1:0];
assign t9i=o_fft16[9][DATA_WIDTH-1:0];
assign t10i=o_fft16[10][DATA_WIDTH-1:0];
assign t11i=o_fft16[11][DATA_WIDTH-1:0];
assign t12i=o_fft16[12][DATA_WIDTH-1:0];
assign t13i=o_fft16[13][DATA_WIDTH-1:0];
assign t14i=o_fft16[14][DATA_WIDTH-1:0];
assign t15i=o_fft16[15][DATA_WIDTH-1:0];






assign t_rst_sp=t3_rst_ser_to_par || t4_rst_ser_to_par;

always_comb
  begin
 
            o_fft16[0] = t_o_fft16[0];
            o_fft16[1] = t_o_fft16[2];
            o_fft16[2] = t_o_fft16[4];
            o_fft16[3] = t_o_fft16[6];
            o_fft16[4] = t_o_fft16[8];
            o_fft16[5] = t_o_fft16[10];
            o_fft16[6] = t_o_fft16[12];
            o_fft16[7] = t_o_fft16[14];
            o_fft16[8] = t_o_fft16[1];
            o_fft16[9] = t_o_fft16[3];
            o_fft16[10] = t_o_fft16[5];
            o_fft16[11] = t_o_fft16[7];
            o_fft16[12] = t_o_fft16[9];
            o_fft16[13] = t_o_fft16[11];
            o_fft16[14] = t_o_fft16[13];
            o_fft16[15] = t_o_fft16[15];

  end

always_comb
begin
if(t_stage4==1) begin
//t_en_btrfly_control_fft16=  t4_en_btrfly_control_fft16;
t_rd_add_control_fft16   = t4_rd_add_control_fft16;
t_a_rd_index_control_fft16=  t4_a_rd_index_control_fft16;   
t_b_rd_index_control_fft16=  t4_b_rd_index_control_fft16;
t_indx_twid_control_fft16=   t4_indx_twid_control_fft16;
//t_j_or_cmp_btrfly_fft16=     t4_j_or_cmp_btrfly_fft16;

end else begin
//t_en_btrfly_control_fft16=   t3_en_btrfly_control_fft16;
t_rd_add_control_fft16   =   t3_rd_add_control_fft16;
t_a_rd_index_control_fft16=  t3_a_rd_index_control_fft16;   
t_b_rd_index_control_fft16=  t3_b_rd_index_control_fft16;
t_indx_twid_control_fft16=   t3_indx_twid_control_fft16;
//t_j_or_cmp_btrfly_fft16=     t3_j_or_cmp_btrfly_fft16;

end
end

three_stages_fsm_fft16  #(.DATA_WIDTH(DATA_WIDTH),   
                                            .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH), 
                                            .ADD_SIZE(4)) 
three_stages_fsm(
                .i_clk_control_fft16(i_clk_fft16),     
                .i_rst_n(i_rst_n),
                .i_done_rearrange_control_fft16(t_done_rearrange_control_fft16),

              //  .i_done_wr_control_fft16(t_done_wr_control_fft16),
                .i_valid_mapper_control_fft16(i_valid_mapper_control_fft16),
                .i_done_btrfly_control_fft16(t_done_btrfly_control_fft16),
 

                //.o_en_btrfly_control_fft16(t3_en_btrfly_control_fft16),
                .o_en_arrg_control_fft16(t_en_arrg_control_fft16) ,

                .o_wr_en_control_fft16(t_wr_en_control_fft16),
                .o_done_stage3_control_fft16(t_done_stage3_control_fft16),
                .o_mem_initial_control_fft16(t_mem_initial_control_fft16),
                .o_ready_control_fft16(t_ready_control_fft16),
                //o_rd_allmem_stage3_control_fft16(t_rd_allmem_stage3_control_fft16),
                .o_wr_add_control_fft16(t_wr_add_control_fft16),
                .o_rd_add_control_fft16(t3_rd_add_control_fft16),
                .o_a_rd_index_control_fft16(t3_a_rd_index_control_fft16),   
                .o_b_rd_index_control_fft16(t3_b_rd_index_control_fft16),
                .o_a_wr_index_control_fft16(t_a_wr_index_control_fft16),   
                .o_b_wr_index_control_fft16(t_b_wr_index_control_fft16),
                .o_indx_twid_control_fft16(t3_indx_twid_control_fft16),
                .o_stage_3(t_stage3),
                .o_rst_ser_to_par(t3_rst_ser_to_par),


////newwwwwwwww
                .o_start_stage4(t_start_stage4),
                .o_last_btrfly_stage3(t_last_btrfly_stage3)

);

dp_fft16 #(.DATA_WIDTH(DATA_WIDTH),   
                                          .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH), 
                                          .ADD_SIZE(2)   ,                                    
                                          .INT_WIDTH(INT_WIDTH),
                                          .FRAC_WIDTH(FRAC_WIDTH))
three_stages_dp(
                    .i_clk_dp_fft16(i_clk_fft16),    
                    .i_rst_n(i_rst_n),
                    .i_data_mapper_dp_fft16(i_fft16) ,

                    .i_wr_add_control_fft16(t_wr_add_control_fft16),
                    .i_rd_add_control_fft16(t_rd_add_control_fft16),
                    .i_a_rd_index_dp_fft16(t_a_rd_index_control_fft16),   
                    .i_b_rd_index_dp_fft16(t_b_rd_index_control_fft16),
                    .i_a_wr_index_dp_fft16(t_a_wr_index_control_fft16),   
                    .i_b_wr_index_dp_fft16(t_b_wr_index_control_fft16), 
                    .i_wr_en_dp_fft16(t_wr_en_control_fft16),
                    .i_mem_initial_dp_fft16(t_mem_initial_control_fft16),
                    .i_en_arrg_dp_fft16(t_en_arrg_control_fft16),

                    .i_add_twid_rom_dp_fft16(t_indx_twid_control_fft16), 

                    .i_done_stage3_fft16(t_done_stage3_control_fft16),
             
                   .i_wr_en_reg_dp_fft16(t_wr_en_reg_stage4_fft16),
                   .i_rst_serpar3(t_rst_sp),
                   .i_rst_serpar4(t4_rst_ser_to_par),
                    .i_stage3(t_stage3),

                    .i_num_stage3(t_num_stage3),



                    .o_done_arrange_dp_fft16(t_done_rearrange_control_fft16),

                    .o_valid_btrfly_dp_fft16(t_done_btrfly_control_fft16),
 
                    .o_stage4_dp_fft16(t_o_fft16)

);


stage4_fsm_fft16#(.DATA_WIDTH(DATA_WIDTH),   
                                          .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH), //for real and imaginary
                                          .ADD_SIZE(2))
stage4_fsm(
                .i_clk_stage4_fft16(i_clk_fft16),
                .i_rst_n(i_rst_n),

                .i_valid_stage3_fft16(t_start_stage4),//t_done_stage3_control_fft16),
                .i_done_btrfly_stage4_fft16(t_done_btrfly_control_fft16),


                .i_last_btrfly_stage3(t_last_btrfly_stage3), //neww 18/4

                .o_done_stage4_fft16(o_done_fft16),
                .o_wr_en_reg_stage4_fft16(t_wr_en_reg_stage4_fft16),
                .o_a_wr_reg_stage4_fft16(t_a_wr_reg_stage4_fft16),
                .o_b_wr_reg_stage4_fft16(t_b_wr_reg_stage4_fft16),

                //.o_en_btrfly_stage4_fft16(t4_en_btrfly_control_fft16),
                .o_indx_twid_stage4_fft16(t4_indx_twid_control_fft16),

                .o_a_rd_indx_stage4_fft16(t4_a_rd_index_control_fft16),

                .o_b_rd_indx_stage4_fft16(t4_b_rd_index_control_fft16),

                //.o_j_or_cmp_btrfly_fft16(t4_j_or_cmp_btrfly_fft16),
                .o_rst_ser_to_par(t4_rst_ser_to_par),
                .o_stage4(t_stage4),
                .o_rd_add_control_fft16(t4_rd_add_control_fft16),
                
                .o_num_stage3(t_num_stage3)
);



endmodule