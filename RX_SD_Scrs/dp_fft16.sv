/*
Project        : NB-IOT UPLINK
Standard doc.  : 
Module name    : three_stages_dp_fft16 
Dependancy     :
Design doc.    : 
References     : 
Description    : datapath for the 3 stages of the 16fft
Owner          : Martina Magued
*/
//dp= data path


module dp_fft16 
#(parameter 			                        DATA_WIDTH	=16,   
                                          DOUBLE_DATA_WIDTH = 32,//2*DATA_WIDTH, //for real and imaginary
                                          ADD_SIZE = 2,
                                          INT_WIDTH=4,
                                          FRAC_WIDTH=12
)
(
input logic                                       i_clk_dp_fft16,     
                                                  i_rst_n,

input logic signed [DOUBLE_DATA_WIDTH-1:0]        i_data_mapper_dp_fft16 [15:0], 

input logic                                       i_wr_add_control_fft16,
input logic                                       i_rd_add_control_fft16,

input logic [5:0]                                 i_a_rd_index_dp_fft16,   
input logic [5:0]                                 i_b_rd_index_dp_fft16,
input logic [2:0]                                 i_a_wr_index_dp_fft16,   
input logic [2:0]                                 i_b_wr_index_dp_fft16, 

input logic                                       
                                                  i_wr_en_dp_fft16,
                                                  i_mem_initial_dp_fft16,
                                                  i_en_arrg_dp_fft16,

input logic [2:0]                                 i_add_twid_rom_dp_fft16,
                                                  
input logic                                       i_done_stage3_fft16,
                                                  i_wr_en_reg_dp_fft16,
                                                  i_rst_serpar3,
                                                  i_rst_serpar4,
                                                  i_stage3,

input logic [1:0] i_num_stage3,

//new 30/4
 //   input logic                                i_stage4,

output logic                                      o_done_arrange_dp_fft16,
                                                  o_valid_btrfly_dp_fft16,
                                                  
output logic signed [DOUBLE_DATA_WIDTH-1:0]       o_stage4_dp_fft16 [15:0] 
);
logic signed [DOUBLE_DATA_WIDTH-1:0] t1_a_stage3_dp_fft16;
logic signed [DOUBLE_DATA_WIDTH-1:0] t1_b_stage3_dp_fft16;


logic signed [DOUBLE_DATA_WIDTH-1:0] t_a_stage4_dp_fft16;
logic signed [DOUBLE_DATA_WIDTH-1:0] t_b_stage4_dp_fft16;

logic signed [DATA_WIDTH-1:0] t_a_real_to_btrfly_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_a_imag_to_btrfly_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_b_real_to_btrfly_dp_fft16; 
logic signed [DATA_WIDTH-1:0] t_b_imag_to_btrfly_dp_fft16; 

logic signed [DATA_WIDTH-1:0] t_a_real_from_btrfly_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_a_imag_from_btrfly_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_b_real_from_btrfly_dp_fft16; 
logic signed [DATA_WIDTH-1:0] t_b_imag_from_btrfly_dp_fft16;  


logic signed [DATA_WIDTH-1:0] t_o_real_twid_rom_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_o_imag_twid_rom_dp_fft16;
logic signed [DOUBLE_DATA_WIDTH-1:0] t_o_twid_rom_dp_fft16;

logic signed [DOUBLE_DATA_WIDTH-1:0] t_data_to_memories_dp_fft16 [7:0];

logic signed [DOUBLE_DATA_WIDTH-1:0]t_arranged_input_dp_fft16 [15:0] ;

logic signed [DOUBLE_DATA_WIDTH-1:0]  t_a_data_from_memories_dp_fft16;
logic signed [DOUBLE_DATA_WIDTH-1:0]  t_b_data_from_memories_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_b_real_from_cmp_dp_fft16;
logic signed [DATA_WIDTH-1:0] t_b_imag_from_cmp_dp_fft16;
logic [1:0] t_a_b [7:0];

logic signed [DOUBLE_DATA_WIDTH-1:0]t_o1_stage3_dp_fft16 [17:0];//33:0] ; //33 for dummy row
logic signed [DOUBLE_DATA_WIDTH-1:0]t_o_stage4_dp_fft16 [17:0] ; //17 for dummy row

logic signed    [DATA_WIDTH-1:0]        t_b_re;
logic signed    [DATA_WIDTH-1:0]        t_b_im;

assign t_o_real_twid_rom_dp_fft16 = t_o_twid_rom_dp_fft16[DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
assign t_o_imag_twid_rom_dp_fft16 = t_o_twid_rom_dp_fft16[DATA_WIDTH-1:0];
assign o_stage4_dp_fft16=t_o_stage4_dp_fft16[15:0];

always_comb
  begin
  o_done_arrange_dp_fft16='0;  



            t_arranged_input_dp_fft16[0] = i_data_mapper_dp_fft16[0];
            t_arranged_input_dp_fft16[1] = i_data_mapper_dp_fft16[8];
            t_arranged_input_dp_fft16[2] = i_data_mapper_dp_fft16[4];
            t_arranged_input_dp_fft16[3] = i_data_mapper_dp_fft16[12];
            t_arranged_input_dp_fft16[4] = i_data_mapper_dp_fft16[2];
            t_arranged_input_dp_fft16[5] = i_data_mapper_dp_fft16[10];
            t_arranged_input_dp_fft16[6] = i_data_mapper_dp_fft16[6];
            t_arranged_input_dp_fft16[7] = i_data_mapper_dp_fft16[14];
            t_arranged_input_dp_fft16[8] = i_data_mapper_dp_fft16[1];
            t_arranged_input_dp_fft16[9] = i_data_mapper_dp_fft16[9];
            t_arranged_input_dp_fft16[10] = i_data_mapper_dp_fft16[5];
            t_arranged_input_dp_fft16[11] = i_data_mapper_dp_fft16[13];
            t_arranged_input_dp_fft16[12] = i_data_mapper_dp_fft16[3];
            t_arranged_input_dp_fft16[13] = i_data_mapper_dp_fft16[11];
            t_arranged_input_dp_fft16[14] = i_data_mapper_dp_fft16[7];
            t_arranged_input_dp_fft16[15] = i_data_mapper_dp_fft16[15];


     if (i_en_arrg_dp_fft16) 
  o_done_arrange_dp_fft16 = 1; 
     
    

    
    if(i_mem_initial_dp_fft16)
    begin  

      {t_a_real_to_btrfly_dp_fft16,t_a_imag_to_btrfly_dp_fft16}=t_arranged_input_dp_fft16[i_a_rd_index_dp_fft16];//i_data_mapper_dp_fft16[i_a_rd_index_dp_fft16];//

      {t_b_real_to_btrfly_dp_fft16,t_b_imag_to_btrfly_dp_fft16}=t_arranged_input_dp_fft16[i_b_rd_index_dp_fft16];//i_data_mapper_dp_fft16[i_b_rd_index_dp_fft16];//t_arranged_input_dp_fft16[i_b_rd_index_dp_fft16];

    end


    else 
    begin

          t_a_real_to_btrfly_dp_fft16 = t_a_data_from_memories_dp_fft16[DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
          t_a_imag_to_btrfly_dp_fft16 = t_a_data_from_memories_dp_fft16[DATA_WIDTH-1:0];
    
          t_b_real_to_btrfly_dp_fft16=t_b_real_from_cmp_dp_fft16;
          t_b_imag_to_btrfly_dp_fft16=t_b_imag_from_cmp_dp_fft16;


  end

  end
always_comb begin
    t_a_b[0] = '0;
    t_a_b[1] = '0;
    t_a_b[2] = '0;
    t_a_b[3] = '0;
    t_a_b[4] = '0;
    t_a_b[5] = '0;
    t_a_b[6] = '0;
    t_a_b[7] = '0;

case(i_a_wr_index_dp_fft16)
   3'b000: t_a_b[0][1]=1;
   3'b001: t_a_b[1][1]=1;
   3'b010: t_a_b[2][1]=1;
   3'b011: t_a_b[3][1]=1;
   3'b100: t_a_b[4][1]=1;
   3'b101: t_a_b[5][1]=1;
   3'b110: t_a_b[6][1]=1;
   3'b111: t_a_b[7][1]=1;  
endcase

case(i_b_wr_index_dp_fft16)
   3'b000: t_a_b[0][0]=1;
   3'b001: t_a_b[1][0]=1;
   3'b010: t_a_b[2][0]=1;
   3'b011: t_a_b[3][0]=1;
   3'b100: t_a_b[4][0]=1;
   3'b101: t_a_b[5][0]=1;
   3'b110: t_a_b[6][0]=1;
   3'b111: t_a_b[7][0]=1;  
endcase





//****************************
case(t_a_b[0])

    2'b01:t_data_to_memories_dp_fft16[0]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[0]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[0]='0;
endcase



case(t_a_b[1])

    2'b01:t_data_to_memories_dp_fft16[1]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[1]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[1]='0;
endcase



case(t_a_b[2])

    2'b01:t_data_to_memories_dp_fft16[2]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[2]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[2]='0;

endcase

case(t_a_b[3])

    2'b01:t_data_to_memories_dp_fft16[3]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[3]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[3]='0;
endcase

case(t_a_b[4])

    2'b01:t_data_to_memories_dp_fft16[4]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[4]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[4]='0;

endcase

case(t_a_b[5])

    2'b01:t_data_to_memories_dp_fft16[5]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[5]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[5]='0;

endcase

case(t_a_b[6])

    2'b01:t_data_to_memories_dp_fft16[6]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[6]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[6]='0;

endcase

case(t_a_b[7])

    2'b01:t_data_to_memories_dp_fft16[7]={t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16};
    2'b10:t_data_to_memories_dp_fft16[7]={t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16};
    default: t_data_to_memories_dp_fft16[7]='0;
endcase 
//**********************************/



t1_a_stage3_dp_fft16= {t_a_real_from_btrfly_dp_fft16,t_a_imag_from_btrfly_dp_fft16};
t1_b_stage3_dp_fft16= {t_b_real_from_btrfly_dp_fft16,t_b_imag_from_btrfly_dp_fft16};

      


        t_b_re=t_b_data_from_memories_dp_fft16[DOUBLE_DATA_WIDTH-1:DATA_WIDTH];
        t_b_im=t_b_data_from_memories_dp_fft16[DATA_WIDTH-1:0];



        t_a_stage4_dp_fft16 = {t_a_real_from_btrfly_dp_fft16,t_a_imag_from_btrfly_dp_fft16};
        t_b_stage4_dp_fft16 = {t_b_real_from_btrfly_dp_fft16,t_b_imag_from_btrfly_dp_fft16};
end


memories8_fft16 #(.DATA_WIDTH(DATA_WIDTH),   
                                            .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH), 
                                            .RAM_DEPTH(2),
                                            .ADD_SIZE(1)
)
mem(                                        .i_clk_memories_fft16(i_clk_dp_fft16),
                                            .i_rst_n(i_rst_n),
                                            .i_done_stage3_fft16(i_done_stage3_fft16),

                                            .i_data_memories_fft16(t_data_to_memories_dp_fft16),   
                                            .i_rd_add_memories_fft16(i_rd_add_control_fft16),   
                                            .i_wr_add_memories_fft16(i_wr_add_control_fft16),
                                            .i_wr_en_memories_fft16(i_wr_en_dp_fft16),
                                            .i_a_rd_index_memories_fft16(i_a_rd_index_dp_fft16),   
                                            .i_b_rd_index_memories_fft16(i_b_rd_index_dp_fft16),
                                            .i_a_wr_index_memories_fft16(i_a_wr_index_dp_fft16),   
                                            .i_b_wr_index_memories_fft16(i_b_wr_index_dp_fft16),   

                                            .i_num_stage3(i_num_stage3), 

                                            

                                            .o_a_data_memories_fft16(t_a_data_from_memories_dp_fft16),
                                            .o_b_data_memories_fft16(t_b_data_from_memories_dp_fft16)

);



btrfly_fft16  #(.DATA_WIDTH(DATA_WIDTH),  .FRAC_WIDTH(FRAC_WIDTH),.INT_WIDTH(INT_WIDTH))
         btrfly(
            .i_a_real_btrfly_fft16(t_a_real_to_btrfly_dp_fft16), 
            .i_a_imag_btrfly_fft16(t_a_imag_to_btrfly_dp_fft16), 
            
            .i_b_real_btrfly_fft16(t_b_real_to_btrfly_dp_fft16), 
            .i_b_imag_btrfly_fft16(t_b_imag_to_btrfly_dp_fft16), 
            
            .o_valid_btrfly_fft16(o_valid_btrfly_dp_fft16),
            
            .o_sum_real_btrfly_fft16(t_a_real_from_btrfly_dp_fft16),             
            .o_sum_imag_btrfly_fft16(t_a_imag_from_btrfly_dp_fft16),
            .o_minus_real_btrfly_fft16(t_b_real_from_btrfly_dp_fft16),             
            .o_minus_imag_btrfly_fft16(t_b_imag_from_btrfly_dp_fft16)
);

compmul_fft16#(
      .DATA_WIDTH (DATA_WIDTH),
      .FRAC_WIDTH (FRAC_WIDTH),
      .INT_WIDTH  (INT_WIDTH) )
 complexmul     (
      .i_a_re(t_o_real_twid_rom_dp_fft16),
      .i_a_im(t_o_imag_twid_rom_dp_fft16),
      .i_b_re(t_b_re),
      .i_b_im(t_b_im),
      .o_res_re(t_b_real_from_cmp_dp_fft16),
      .o_res_im(t_b_imag_from_cmp_dp_fft16)
  );


flexrom_fft16#(
        .DATA_WIDTH(DATA_WIDTH), 
        .ADDR_WIDTH(ADD_SIZE)) 
twidrom(
          .i_addr(i_add_twid_rom_dp_fft16),
          .o_data_out(t_o_twid_rom_dp_fft16)
    );

//ser_par_fft16#(.DATA_WIDTH(DATA_WIDTH),  
//           .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH),
//            .DEPTH(18))//34)) //4+8+4  * 2 //one row dummy
//sertopar31(
//    .clk(i_clk_dp_fft16)   ,                                   
//    .i_rst_n(i_rst_serpar3)         ,                     
//    .i1_data(t1_a_stage3_dp_fft16)  ,
//    .i2_data (t1_b_stage3_dp_fft16) ,
//    .o_data(t_o1_stage3_dp_fft16)
//);


ser_par_fft16#(.DATA_WIDTH(DATA_WIDTH),  
           .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH),
                       .DEPTH(18))
sertopar4(
    .clk(i_clk_dp_fft16)   ,                                   
    .i_rst_n(i_rst_serpar4)         ,                     
    .i1_data(t_a_stage4_dp_fft16)  ,
    .i2_data (t_b_stage4_dp_fft16) ,
    .o_data(t_o_stage4_dp_fft16)
);




/*reg_bef_stage4
#(.DATA_WIDTH(DATA_WIDTH))
reg1(
.i_clk(i_clk),
.i_rst_n(i_rst_n),
.i_wen_a(i_wen_a),
.i_wen_b(o_wen_b),
.i_a_wr_index(i_a_wr_index),   
.i_b_wr_index(i_b_wr_index),
.i_a({t_a_real_from_btrfly_dp_fft16, t_a_imag_from_btrfly_dp_fft16}) , 
.i_b({t_b_real_from_btrfly_dp_fft16, t_b_imag_from_btrfly_dp_fft16}) ,
.o_a(),
.o_b()
);*/
endmodule