/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : reg_bef_16ifft
Dependancy     :
Design doc.    : 
References     : 
Description    : used to store the input of the 16 ifft
Owner          : Martina Magued
*/

module reg_bef_16ifft
#(
  parameter DATA_WIDTH = 16
)
(
  input     logic                                i_clk,
                                                 i_rst_n,
  input     logic                                i_wen,
  input     logic                                i_pilot, 
  input     logic signed [2*DATA_WIDTH-1:0]      i_out_RM [15:0], 
  output    logic signed [2*DATA_WIDTH-1:0]      o_in_ifft16 [15:0]
);

logic t_wen;

genvar i;
    generate
        for (i = 0; i < 16; i = i + 1 ) 
        begin : manyreg
            always_ff @( posedge i_clk or negedge i_rst_n ) begin
                if (!i_rst_n)
                begin
                    o_in_ifft16 [i] <= 0;
                end
                else if(i_wen || t_wen) //new
                begin
                    o_in_ifft16 [i] <= i_out_RM[i];
                end
            end
        end
    endgenerate


 //always_ff @( posedge i_clk or negedge i_rst_n ) begin
   always_comb begin
    if(i_wen && !i_pilot)
    t_wen=1;
    else 
    t_wen=0;

 end
endmodule
