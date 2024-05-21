/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : comp2s
Dependancy     :
Design doc.    : 
References     : 
Description    : Used to get a conditional 2's complement.
Owner          : Yahia Ahmed
*/
module comp2s 
    #(
        parameter DATA_WIDTH = 16
    ) 
    (
        input   logic                           i_ctrl,
        input   logic signed [DATA_WIDTH-1:0]   i_din_re,
        input   logic signed [DATA_WIDTH-1:0]   i_din_im,
        output  logic signed [DATA_WIDTH-1:0]   o_dout_re,
        output  logic signed [DATA_WIDTH-1:0]   o_dout_im
    );

  always_comb 
    begin
        o_dout_re = (i_din_re ^ {DATA_WIDTH{i_ctrl}}) + i_ctrl; // as simple as that ;)
        o_dout_im = (i_din_im ^ {DATA_WIDTH{i_ctrl}}) + i_ctrl; // as simple as that ;)
    end

endmodule