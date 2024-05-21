/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : comp2sre
Dependancy     :
Design doc.    : 
References     : 
Description    : Used to get a conditional 2's complement for real nums.
Owner          : Yahia Ahmed
*/
module comp2sre 
    #(
        parameter DATA_WIDTH = 16
    ) 
    (
        input   logic                           i_ctrl,
        input   logic signed [DATA_WIDTH-1:0]   i_din,
        output  logic signed [DATA_WIDTH-1:0]   o_dout
    );

  always_comb 
    begin
        o_dout = (i_din ^ {DATA_WIDTH{i_ctrl}}) + i_ctrl; // as simple as that ;)
    end

endmodule