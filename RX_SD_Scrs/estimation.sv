/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : estimation
Dependancy     :
Design doc.    : 
References     : 
Description    : Channel estimation
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

module estimation
#(parameter 			                     DATA_WIDTH=	16,
                                          INT_WIDTH=   4,
                                          FRAC_WIDTH=  12
)
(
input logic                                  i_clk_est,
                                             i_rst_n,
//input logic                                i_start_est, 
input logic [2:0]                            i_symbol_num, //from 0 to 6  (4=pilot)//from block mariam

input logic  signed [2*DATA_WIDTH-1:0]       i_tx_inv_pilot[11:0],
//input logic  signed [DATA_WIDTH-1:0]     i_tx_inv_pilot_im[11:0],
input logic  signed [2*DATA_WIDTH-1:0]       i_rx_pilot[11:0],
//input logic  signed [DATA_WIDTH-1:0]       i_rx_pilot_im [11:0],


//output logic signed [DATA_WIDTH-1:0]       o_est_re [11:0],
//output logic signed [DATA_WIDTH-1:0]       o_est_im [11:0],
output logic signed [2*DATA_WIDTH-1:0]     o_est_ch[11:0], 
//output logic                               o_done_est, //for equalizer
output logic [11:0]                        o_est_done                                                  
);

logic  signed [2*DATA_WIDTH-1:0]     t_est_ch[12:0]; //one dummy

logic [3:0]                          t_indx;

logic  signed [DATA_WIDTH-1:0]       t_tx_inv_pilot_re;
logic  signed [DATA_WIDTH-1:0]       t_tx_inv_pilot_im;

logic  signed [DATA_WIDTH-1:0]       t_rx_pilot_re;
logic  signed [DATA_WIDTH-1:0]       t_rx_pilot_im;

logic  signed [DATA_WIDTH-1:0]       t_est_re;
logic  signed [DATA_WIDTH-1:0]       t_est_im;

logic t_rst_serpar;

always_comb begin
   t_tx_inv_pilot_re = '0;//i_tx_inv_pilot[2*DATA_WIDTH-1:DATA_WIDTH][0];
   t_tx_inv_pilot_im = '0;//i_tx_inv_pilot[DATA_WIDTH-1:0][0];
   t_rx_pilot_re = '0;//i_rx_pilot[2*DATA_WIDTH-1:DATA_WIDTH][0];
   t_rx_pilot_im = '0;//i_rx_pilot[DATA_WIDTH-1:0][0];
   
case (t_indx) 
4'b0000: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[0][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[0][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[0][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[0][DATA_WIDTH-1:0];
   //o_est_re[0] = t_est_re;
   //o_est_im[0] = t_est_im;  

end

4'b0001: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[1][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[1][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[1][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[1][DATA_WIDTH-1:0];
   //o_est_re[1] = t_est_re;
   //o_est_im[1] = t_est_im;  
end

4'b0010: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[2][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[2][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[2][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[2][DATA_WIDTH-1:0];
   //o_est_re[2] = t_est_re;
   //o_est_im[2] = t_est_im;  
end

4'b0010: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[2][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[2][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[2][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[2][DATA_WIDTH-1:0];
   //o_est_re[2] = t_est_re;
   //o_est_im[2] = t_est_im;  
end

4'b0011: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[3][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[3][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[3][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[3][DATA_WIDTH-1:0];
   //o_est_re[3] = t_est_re;
   //o_est_im[3] = t_est_im;  
end

4'b0100: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[4][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[4][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[4][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[4][DATA_WIDTH-1:0];
   //o_est_re[4] = t_est_re;
   //o_est_im[4] = t_est_im;  
end

4'b0101: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[5][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[5][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[5][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[5][DATA_WIDTH-1:0];
   //o_est_re[5] = t_est_re;
   //o_est_im[5] = t_est_im;  
end

4'b0110: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[6][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[6][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[6][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[6][DATA_WIDTH-1:0];
   //o_est_re[6] = t_est_re;
   //o_est_im[6] = t_est_im;  
end

4'b0111: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[7][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[7][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[7][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[7][DATA_WIDTH-1:0];
   //o_est_re[7] = t_est_re;
   //o_est_im[7] = t_est_im;  
end

4'b1000: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[8][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[8][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[8][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[8][DATA_WIDTH-1:0];
   //o_est_re[8] = t_est_re;
   //o_est_im[8] = t_est_im;  
end

4'b1001: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[9][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[9][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[9][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[9][DATA_WIDTH-1:0];
   //o_est_re[9] = t_est_re;
   //o_est_im[9] = t_est_im;  
end

4'b1010: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[10][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[10][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[10][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[10][DATA_WIDTH-1:0];
   //o_est_re[10] = t_est_re;
   //o_est_im[10] = t_est_im;  
end

4'b1011: begin
   t_tx_inv_pilot_re = i_tx_inv_pilot[11][2*DATA_WIDTH-1:DATA_WIDTH];
   t_tx_inv_pilot_im = i_tx_inv_pilot[11][DATA_WIDTH-1:0];
   t_rx_pilot_re = i_rx_pilot[11][2*DATA_WIDTH-1:DATA_WIDTH];
   t_rx_pilot_im = i_rx_pilot[11][DATA_WIDTH-1:0];
   //o_est_re[11] = t_est_re;
   //o_est_im[11] = t_est_im;  
end


default: begin
   t_tx_inv_pilot_re = '0;//i_tx_inv_pilot[2*DATA_WIDTH-1:DATA_WIDTH][0];
   t_tx_inv_pilot_im = '0;//i_tx_inv_pilot[DATA_WIDTH-1:0][0];
   t_rx_pilot_re = '0;//i_rx_pilot[2*DATA_WIDTH-1:DATA_WIDTH][0];
   t_rx_pilot_im = '0;//i_rx_pilot[DATA_WIDTH-1:0][0];
end
endcase

/*for (int i = 0; i < 12; i++) begin
o_est_re[i]=o_est_ch[i][2*DATA_WIDTH-1:DATA_WIDTH];
o_est_im[i]=o_est_ch[i][DATA_WIDTH-1:0];
end*/
end

assign o_est_ch=t_est_ch[11:0];


compmul_fft16 #(  .DATA_WIDTH (DATA_WIDTH),
      .FRAC_WIDTH (FRAC_WIDTH),
      .INT_WIDTH  (INT_WIDTH)) 
mul(
    .i_a_re(t_tx_inv_pilot_re),
    .i_a_im(t_tx_inv_pilot_im),
    .i_b_re(t_rx_pilot_re),
    .i_b_im(t_rx_pilot_im),
    .o_res_re(t_est_re), //change later
    .o_res_im(t_est_im)
  );

ser_par_ch #(.DATA_WIDTH(DATA_WIDTH),  
           .DOUBLE_DATA_WIDTH(2*DATA_WIDTH),
           .DEPTH(13)) //12*2 +1 //one row dummy
sertopar(
    .clk(i_clk_est)   ,                                   
    .i_rst_n(t_rst_serpar),//i_rst_n)         ,                     
    .i_data({t_est_re,t_est_im}),
    //.i2_data (t_est_im) ,
    .o_data(t_est_ch)
);

fsm_est fsm
(  .i_clk_est(i_clk_est),     
   .i_rst_n(i_rst_n),
   //.i_start_est(i_symbol_num),
   .i_symbol_num(i_symbol_num),
   .o_indx(t_indx),
  // .o_done_est(o_done_est)
   .o_est_done(o_est_done),
   .o_rst_ser_par(t_rst_serpar)
);


endmodule