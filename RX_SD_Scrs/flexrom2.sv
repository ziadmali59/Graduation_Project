/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : flexrom
Dependancy     :
Design doc.    : 
References     : 
Description    : dual-port ROM used for storing the constellation constants for BPSK/QPSK/16-QAM
Owner          : Yahia Ahmed
*/
module flexrom2
    #(
        parameter DATA_WIDTH = 16, 
        parameter ADDR_WIDTH = 2
    ) 
    (
    input   logic       [ADDR_WIDTH-1:0]        i_addr_1,
    input   logic       [ADDR_WIDTH-1:0]        i_addr_2,
    output  logic       [DATA_WIDTH-1:0]        o_data_out_1,
    output  logic       [DATA_WIDTH-1:0]        o_data_out_2
    );

  logic [DATA_WIDTH-1:0] rom [0:2**ADDR_WIDTH-1];

  // Initialize the ROM content using readmemh
  initial begin
    $readmemb("ConstMod_fp.mem", rom);
  end

  assign        o_data_out_1       =         rom[i_addr_1];
  assign        o_data_out_2       =         rom[i_addr_2];

endmodule
