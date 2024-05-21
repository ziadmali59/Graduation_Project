/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : flexrom
Dependancy     :
Design doc.    : 
References     : 
Description    : dual-port ROM used for storing the twiddle factors
Owner          : Martina Magued
*/
module flexrom_fft16
    #(
        parameter DATA_WIDTH = 16, 
        parameter ADDR_WIDTH = 8
    ) 
    (
    input   logic       [2:0]        i_addr,
    output  logic       [2*DATA_WIDTH-1:0]       o_data_out

    );

  logic [2*DATA_WIDTH-1:0] rom [0:7];

  // Initialize the ROM content using readmemh
  initial begin
    $readmemb("TW_binary.mem", rom);  //W_binary32
  end

  assign        o_data_out      =         rom[i_addr];

endmodule
