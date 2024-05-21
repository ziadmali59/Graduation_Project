/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : TX_TOP
Dependancy     :
Design doc.    : 
References     : 
Description    : Uplink Transmitter
Owner          : *All the members*
*/

module TX_TOP 
#(parameter TBS = 32 , 
  parameter G = 576, 
  parameter Qm = 4, 
  parameter rv_indx = 0,
  parameter DATA_WIDTH=	16,   
  parameter INT_WIDTH=   4,
  parameter FRAC_WIDTH =  12,
  parameter ACP_SAMPLES = 138,
  parameter NRU = 1,
  parameter Nslots = 2,
  parameter Nsc = 12
)
(
input  logic	                                   i_clk,
input  logic	                                   i_rst_n,

//BD
input  logic                                       i_data_crc,

//SD
input  logic                [5:0]                  i_Isc, 
input  logic                [2:0]                  i_Qm  ,
input  logic                [1:0]                  i_n_sc,
input  logic                [2:0]                  i_Irep,
input  logic                [4:0]                  t_u,
input  logic                [1:0]                  sixTone_BaseSequence,
input  logic                [1:0]                  threeTone_BaseSequence,
input  logic                [3:0]                  i_Nsc,

output logic signed         [2*DATA_WIDTH-1:0]     o_ifft16 [15:0],
output logic                                       o_done_TX, //done_ifft16

//add cp
output    wire signed    [DATA_WIDTH-1:0]          o_TX_re    [0:ACP_SAMPLES-1], 
output    wire signed    [DATA_WIDTH-1:0]          o_TX_im    [0:ACP_SAMPLES-1]
);


//BD
logic                       t_Scrambler;
logic signed [0:0]          t_din [0:0];
logic                       t_Valid_Scrambler;
logic                       t_Shift_Done;    

assign t_din = {{t_Scrambler}};
BD_TOP #(.TBS     (TBS), 
         .G       (G), 
         .Qm      (Qm),
         .rv_indx (rv_indx),
         .NRU     (NRU),
         .Nslots  (Nslots),
         .Nsc     (Nsc)
         )
BD_TOP    (
.o_Scrambler                (t_Scrambler),
.o_Valid_Scrambler          (t_Valid_Scrambler),
.o_Shift_Done               (t_Shift_Done),      
.i_data_crc                 (i_data_crc),
.i_clk_crc                  (i_clk),
.i_rst_crc                  (i_rst_n)                                                              
    );

SD_TOP #( 	    
      .DATA_WIDTH (DATA_WIDTH), 
      .INT_WIDTH  (INT_WIDTH),
      .FRAC_WIDTH (FRAC_WIDTH)
    )
SD_TOP(
.i_clk                      (i_clk),
.i_rst_n                    (i_rst_n),
.i_start                    (t_Valid_Scrambler),
.i_Isc                      (i_Isc), 
.i_din                      (t_din),
.i_Qm                       (Qm),
.i_n_sc                     (i_n_sc),
.i_Irep                     (i_Irep),
.t_u                        (t_u),
.sixTone_BaseSequence       (sixTone_BaseSequence),
.threeTone_BaseSequence     (threeTone_BaseSequence),
.i_Nsc                      (i_Nsc),
.o_ifft16                   (o_ifft16),
.o_done_ifft16              (o_done_TX),
.o_SD_re                    (o_TX_re),
.o_SD_im                    (o_TX_im)
);


endmodule