/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : equalization
Dependancy     :
Design doc.    : 
References     : 
Description    : Channel equalization
Owner          : Martina Magued
*/
/*package stuff;
  typedef enum logic [3:0] {
     Valid_1,
     Valid_2,
     Valid_3,
     Valid_4_Pilot,
     Valid_5,
     Valid_6,
     Valid_7,
     Not_Valid} o_valid_count;
endpackage*/

module equalization 
#(parameter 			                        DATA_WIDTH=	16,
                                          INT_WIDTH=   4,
                                          FRAC_WIDTH=  12
)
(
input logic                                i_clk_equ,
                                           i_rst_n,
//input logic                                i_start_equ, 

input logic  signed [2*DATA_WIDTH-1:0]       i_h [11:0],  //from estimation
//input logic  signed [DATA_WIDTH-1:0]       i_h_im [11:0],
input logic  signed [DATA_WIDTH-1:0]         i_recip_snr,   //can change size later
input logic  signed [2*DATA_WIDTH-1:0]       i_rx [11:0],

//input logic [2:0]                          i_state_num,  //from 0 to 6
input logic [11:0]                           i_est_done12, //12 bits (1 for each subcarrier) //from block estimation

input logic [2:0]                            i_symbol_num, //from 0 to 6 //from block mariam
//input o_valid_count	                         i_symbol_num,
output logic                                 o_done_equ_one_symbol,      //before ser to par
output logic signed [2*DATA_WIDTH-1:0]       o_equ [11:0],
output logic                                 o_done_equ, //after ser to par (READY!)  
output logic                                 o_done_equ_7symbols                                     
);
logic                                t_done_div;
//logic                                t_done_equ_one_symbol;
logic [3:0]                          t_wr_add; 
logic [3:0]                          t_rd_add;
logic [3:0]                          t_rd_add_out;
logic                                t_start_div;
logic [2:0]                          t_state_num;
logic                                t_done_equ;//new 15/5




//dp_equ_single_port#( //new 24/4
datapath_equ #(
        .DATA_WIDTH(DATA_WIDTH),
        .DOUBLE_DATA_WIDTH(2*DATA_WIDTH),
        .INT_WIDTH(INT_WIDTH),
        .FRAC_WIDTH(FRAC_WIDTH))
dp(
.i_clk_equ(i_clk_equ),
.i_rst_n(i_rst_n),
//.i_start_equ(), //??????

.i_h(i_h),  //from estimation
.i_recip_snr(i_recip_snr),   
.i_rx(i_rx),
.i_symbol_num(i_symbol_num), //from 0 to 6 //from block mariam
//.i_state_num(),  //from 0 to 6
.i_wr_add(t_wr_add), //to write input in memory
.i_rd_add(t_rd_add), //to read from memory
.i_rd_add_out(t_rd_add_out),

.i_est_done12(i_est_done12), //12 bits 
.i_rst_ser_par(t_rst_ser_par),
.i_start_div(t_start_div),
.i_state_num(t_state_num),

.o_equ(o_equ),           
.o_done_div(t_done_div),

.o_done_equ_one_symbol(o_done_equ_one_symbol),

.o_done_equ(o_done_equ) //new 15/5                                    
);


fsm_equ_wr fsm1
(
  .i_clk_equ(i_clk_equ),     
  .i_rst_n(i_rst_n),
 // .i_start_equ(i_start_equ), //from mariam     
  .i_symbol_num(i_symbol_num), //from mariam                          
  .o_wr_add(t_wr_add) //to write input in memory
  //.o_done_wr_1symbol(t_done_wr_1symbol)
);


fsm_equ_rd fsm2
(
.i_clk_equ(i_clk_equ),     
.i_rst_n(i_rst_n),
.i_div_done(t_done_div),
.i_done_equ_one_symbol(o_done_equ_one_symbol),
.i_est_done_1st_symbol(i_est_done12[0]),

.i_symbol_num(i_symbol_num), //new 15/5

.o_state_num(t_state_num),
//.o_rst_ser_par(t_rst_ser_par),
.o_rd_add(t_rd_add),
//.o_rd_add_out(t_rd_add_out),
.o_done_equ_7symbols(o_done_equ_7symbols),
.o_start_div(t_start_div)
);

fsm_equ_serpar fsm3
(
.i_clk_equ(i_clk_equ),     
.i_rst_n(i_rst_n),
.i_done_equ_one_symbol(o_done_equ_one_symbol),
.o_rd_add_out(t_rd_add_out),
.o_done_equ(t_done_equ),
.o_rst_ser_par(t_rst_ser_par)
);


endmodule