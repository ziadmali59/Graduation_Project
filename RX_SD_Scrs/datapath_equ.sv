/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : datapath_equ
Dependancy     :
Design doc.    : 
References     : 
Description    : Channel equalization using minimum mean square error
                 MMSE= H*.(H.H*+1/SNR)^-1  
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

module datapath_equ 
#(parameter 			                     DATA_WIDTH=	16,
                                       DOUBLE_DATA_WIDTH = 2*DATA_WIDTH,
                                       INT_WIDTH=   4,
                                       FRAC_WIDTH=  12
)
(
input logic                                i_clk_equ,
                                           i_rst_n,
//input logic                                i_start_equ, //??????

input logic  signed [2*DATA_WIDTH-1:0]       i_h [11:0],  //from estimation
//input logic  signed [DATA_WIDTH-1:0]       i_h_im [11:0],
input logic  signed [DATA_WIDTH-1:0]         i_recip_snr,   //can change size later
input logic  signed [2*DATA_WIDTH-1:0]       i_rx [11:0], //from mariam
//input logic  signed [DATA_WIDTH-1:0]       i_rx_im [11:0],
input logic [2:0]                            i_symbol_num, //from 0 to 6 //from block mariam
//input o_valid_count	                         i_symbol_num ,

input logic [2:0]                            i_state_num,  //from 1 to 7
input logic [3:0]                            i_wr_add, //to write input in memory
input logic [3:0]                            i_rd_add, //to read from memory
input logic [3:0]                            i_rd_add_out,
//input logic [3:0]                            i_wr_add_out,
//input logic [3:0]                            i_indx; //from 0 to 11

input logic [11:0]                           i_est_done12, //12 bits (1 for each subcarrier) //from block estimation
input logic                                  i_rst_ser_par,
input logic                                  i_start_div,

output logic signed [2*DATA_WIDTH-1:0]       o_equ [11:0], //one dummy or 11?
//output logic signed [DATA_WIDTH-1:0]       o_equ_im[11:0],
output logic                                 o_done_div,
output logic                                 o_done_equ_one_symbol, //=1 for one cycle when a certain symbol is equalized                                        
output logic                                 o_done_equ
);



logic  signed [2*DATA_WIDTH-1:0]       t_equ[12:0]; //one dummy

logic signed [DATA_WIDTH-1:0]          t_im_conj_h;// [15:0];
logic signed [2*DATA_WIDTH:0]          t_mag_h_square;// [15:0]; //33 bits 
logic signed [DATA_WIDTH-1:0]          t_mmse_denom;// [15:0]; //16 bits ///////////////
//logic signed [2*DATA_WIDTH-1:0]        t_h[11:0];
logic signed [2*DATA_WIDTH-1:0]        t_rx;//[11:0];
logic signed [2*DATA_WIDTH-1:0]        t_rx1;//[11:0]; //output of memory 1
logic signed [2*DATA_WIDTH-1:0]        t_rx2;//[11:0];
logic signed [2*DATA_WIDTH-1:0]        t_rx3;//[11:0];
logic signed [2*DATA_WIDTH-1:0]        t_rx4;//[11:0];
logic signed [2*DATA_WIDTH-1:0]        t_rx5;//[11:0];
logic signed [2*DATA_WIDTH-1:0]        t_rx6;//[11:0];

logic signed [DATA_WIDTH-1:0]          mmse_re; 
logic signed [DATA_WIDTH-1:0]          mmse_im; 
logic signed [DATA_WIDTH-1:0]          t_equ_re; 
logic signed [DATA_WIDTH-1:0]          t_equ_im; 
logic signed [DATA_WIDTH-1:0]          x;
logic signed [DATA_WIDTH-1:0]          y; 


logic  signed [2*DATA_WIDTH-1:0]       t_to_parser;
//logic //t_start_div;
//logic t_div_busy1;    
logic t_div_done1;
//logic t_div_busy2;    
logic t_div_done2;

logic t_wr_en1;
logic t_wr_en2;
logic t_wr_en3;
logic t_wr_en4;
logic t_wr_en5;
logic t_wr_en6;

//logic t_wr_en_out;
logic [3:0] t_rd_add;
//logic [3:0] t_add_out;

assign o_equ=t_equ[11:0];
assign o_done_div= t_div_done1 && t_div_done2;

always_comb begin
        
        t_wr_en1=0;
        t_wr_en2=0; 
        t_wr_en3=0;
        t_wr_en4=0;               
        t_wr_en5=0;
        t_wr_en6=0; 

case(i_symbol_num)
   //symbol_num must be constant for a while (12 cycles) till it be written into memory(check with Mariam)/////////////
   //i think will need to make it from 1 to 7 instead of 0 to 6/////////////// and no need to get signal start
   3'b001: t_wr_en1=1;
   3'b010: t_wr_en2=1; 
   3'b011: t_wr_en3=1;
   3'b101: t_wr_en4=1;                  //no symbol 4 as it is pilot
   3'b110: t_wr_en5=1;
   3'b111: t_wr_en6=1; 
  
   /*Valid_1: t_wr_en1=1;
   Valid_2: t_wr_en2=1; 
   Valid_3: t_wr_en3=1;
   Valid_5: t_wr_en4=1;                  //no symbol 4 as it is pilot
   Valid_6: t_wr_en5=1;
   Valid_7: t_wr_en6=1; */
   default: 
    begin
        t_wr_en1=0;
        t_wr_en2=0; 
        t_wr_en3=0;
        t_wr_en4=0;               
        t_wr_en5=0;
        t_wr_en6=0; 
    end 
endcase


if(i_rd_add==4'b1011 && o_done_div)  //??????????
o_done_equ_one_symbol=1;
else 
o_done_equ_one_symbol=0;



//start calculations
//if(i_est_done12[i_rd_add])
//begin
//t_start_div=1;
if(o_done_div) begin
  if (i_rd_add==4'b1011) //newwww 24.4
    t_rd_add=4'b0000; 
  else
    t_rd_add=i_rd_add+1;
end
else
t_rd_add=i_rd_add;

x=i_h[t_rd_add][2*DATA_WIDTH-1:DATA_WIDTH];
y=i_h[t_rd_add][DATA_WIDTH-1:0];
//real*real + im*im
t_mag_h_square = x*x + y*y;
//i_h[i_indx][2*DATA_WIDTH-1:DATA_WIDTH]*i_h[i_indx][2*DATA_WIDTH-1:DATA_WIDTH] + i_h[i_indx][DATA_WIDTH-1:0]*i_h[i_indx][DATA_WIDTH-1:0];
t_mmse_denom = t_mag_h_square[INT_WIDTH+2*FRAC_WIDTH-1:FRAC_WIDTH] + i_recip_snr ; //truncate then add 1/snr

t_im_conj_h = -i_h[t_rd_add][DATA_WIDTH-1:0];  


//for single port memory
/*if(o_done_div)
t_add_out=i_rd_add; //for write
else 
t_add_out=i_rd_add_out; //for read*/


case(i_state_num)
   3'b001: t_rx=t_rx1;
   3'b010: t_rx=t_rx2; 
   3'b011: t_rx=t_rx3;
   3'b101: t_rx=t_rx4;                 
   3'b110: t_rx=t_rx5;
   3'b111: t_rx=t_rx6; 
   default: t_rx=t_rx1;
endcase


end
div #(
    .WIDTH(DATA_WIDTH),  // width of numbers in bits (integer and fractional)
    .FBITS(FRAC_WIDTH)   // fractional bits within WIDTH
    ) 
div1 (
    .clk(i_clk_equ),    
    .i_rst_n(i_rst_n),   
    .start(i_start_div),//t_start_div), 
    //.busy(t_div_busy1),   
    .done(t_div_done1),   
    .a(i_h[t_rd_add][2*DATA_WIDTH-1:DATA_WIDTH]),  
    .b(t_mmse_denom),  
    .val(mmse_re) 
    );

div #(  .WIDTH(DATA_WIDTH),  
    .FBITS(FRAC_WIDTH)   
    ) 
div2 (
    .clk(i_clk_equ),    
    .i_rst_n(i_rst_n),   
    .start(i_start_div),//t_start_div), 
    //.busy(t_div_busy2),   
    .done(t_div_done2),      
    .a(t_im_conj_h),  
    .b(t_mmse_denom),  
    .val(mmse_im) 
    );


compmul_fft16 #(
      .DATA_WIDTH (DATA_WIDTH),
      .FRAC_WIDTH (FRAC_WIDTH),
      .INT_WIDTH  (INT_WIDTH)
  ) 
mul  (
    .i_a_re(mmse_re),
    .i_a_im(mmse_im),
    .i_b_re(t_rx[2*DATA_WIDTH-1:DATA_WIDTH]), //kanet i_rx[i_rd_add]
    .i_b_im(t_rx[DATA_WIDTH-1:0]),
    .o_res_re(t_equ_re),
    .o_res_im(t_equ_im)
  );

ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram1
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(t_wr_en1),
 .i_data_ram(i_rx[i_wr_add]),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add), 
 .i_wr_add_ram(i_wr_add),
 .o_data_ram(t_rx1)//[t_rd_add])
);


ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram2
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(t_wr_en2),
 .i_data_ram(i_rx[i_wr_add]),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add), 
 .i_wr_add_ram(i_wr_add),
 .o_data_ram(t_rx2)//[t_rd_add])
);

ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram3
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(t_wr_en3),
 .i_data_ram(i_rx[i_wr_add]),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add), 
 .i_wr_add_ram(i_wr_add),
 .o_data_ram(t_rx3)//[t_rd_add])
);

ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram4
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(t_wr_en4),
 .i_data_ram(i_rx[i_wr_add]),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add), 
 .i_wr_add_ram(i_wr_add),
 .o_data_ram(t_rx4)//[t_rd_add])
);

ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram5
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(t_wr_en5),
 .i_data_ram(i_rx[i_wr_add]),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add), 
 .i_wr_add_ram(i_wr_add),
 .o_data_ram(t_rx5)//[t_rd_add])
);

ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram6
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(t_wr_en6),
 .i_data_ram(i_rx[i_wr_add]),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add), 
 .i_wr_add_ram(i_wr_add),
 .o_data_ram(t_rx6)//[t_rd_add])
);

ram_equ #(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram_output
(
 .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(o_done_div),//t_wr_en_out),
 .i_data_ram({t_equ_re,t_equ_im}),  //one or 2 portsssssss??????/
 .i_rd_add_ram(i_rd_add_out), 
 .i_wr_add_ram(i_rd_add),
 .o_data_ram(t_to_parser)
);

/*ram_singleport#(
  .DATA_WIDTH(DATA_WIDTH),  
  .DOUBLE_DATA_WIDTH(DOUBLE_DATA_WIDTH)
)
ram_output
(
  .i_clk_ram(i_clk_equ),
 .i_wr_en_ram(o_done_div),//t_wr_en_out),
 .i_data_ram({t_equ_re,t_equ_im}),  //one or 2 portsssssss??????/
 .i_add_ram(t_add_out), 
 //.i_wr_add_ram(i_rd_add),
 .o_data_ram(t_to_parser)
);*/



ser_par_ch#(.DATA_WIDTH(DATA_WIDTH),  
           .DOUBLE_DATA_WIDTH(2*DATA_WIDTH),
           .DEPTH(13)) //12*2 +1 //one row dummy
sertopar(
    .clk(i_clk_equ),                                   
    .i_rst_n(i_rst_ser_par),                     
    .i_data(t_to_parser),
    .o_data(t_equ),
    .o_done_equ(o_done_equ)//new 15/5
);


endmodule