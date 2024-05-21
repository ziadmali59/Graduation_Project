/*
Project        : Digital Design of Uplink LTE NB-IoT Transceiver PHY (3GPP)
Standard doc.  : 
Module name    : sdpram
Dependancy     :
Design doc.    : 
References     : 
Description    : dual-port RAM used in FFT block
Owner          : Yahia Ahmed
*/
module sdpram 
    #(
        parameter DATA_WIDTH = 16, 
        parameter ADDR_WIDTH = 1
    ) 
    (
        input logic                                 clk,  
                                                    //ena,
                                                    //enb,                                      
                                                    wea,
        input logic         [ADDR_WIDTH-1:0]        waddr       ,
                                                    raddr       ,
 
        input logic         [2*DATA_WIDTH-1:0]      data_in,

        output logic        [2*DATA_WIDTH-1:0]      data_out
    );

  logic [2*DATA_WIDTH-1:0] memory [0:2**ADDR_WIDTH-1];

  always_ff @(posedge clk)
    begin
    //if(ena) begin
    if (wea)
      memory[waddr] <= data_in;
      //end
    end
    
   //always_ff @(posedge clk)
   //latch???????????????
   always_comb
    begin
    //if(enb)
      data_out <= memory[raddr];
    end

endmodule