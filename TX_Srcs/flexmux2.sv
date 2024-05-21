/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : flexmux
Dependancy     :
Design doc.    : 
References     : 
Description    : Flexible Multiplexer in size and half data width :)
Owner          : Yahia Ahmed
*/
module flexmux2
    #(
        parameter  DATA_WIDTH = 16,
        parameter  SEL_WIDTH = 2
    ) 
    (
    input   logic       [SEL_WIDTH-1:0]         select,
    input   logic        [DATA_WIDTH-1:0]        data_in [0:2**SEL_WIDTH-1], // Unpacked array as input
    output  logic       [DATA_WIDTH-1:0]        data_out
    );

    always_comb 
    begin
        data_out    =   data_in[select];
    end
endmodule